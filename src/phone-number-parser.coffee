_ = require 'lodash'
libphonenumber = require 'google-libphonenumber'
exports.PNF = PNF = libphonenumber.PhoneNumberFormat
exports.util = phoneUtil = libphonenumber.PhoneNumberUtil.getInstance()
countryNames   = require './resources/en/country_names'
checker = require './phone-number-checker'

###
# Parse just a single phone number
###
parseNumber = (originalNumber, countryCode) ->
  return null if _(originalNumber).isEmpty()
  cleanedNumber = cleanPhone originalNumber
  return null if checker.inValidPhone cleanedNumber
  parsedNumber = tryParseNumber cleanedNumber, countryCode
  return null if not parsedNumber
  return null if not phoneUtil.isPossibleNumber parsedNumber
  return null if not phoneUtil.isValidNumber parsedNumber

  getPhoneDetails parsedNumber
  

getPhoneDetails = (parsedNumber) ->
  phoneDetails = phoneNumberDetails parsedNumber
  countryCode = phoneUtil.getRegionCodeForNumber parsedNumber
  return phoneDetails #if phoneDetails and phoneUtil.isValidNumberForRegion parsedNumber, countryCode
  

###
# Eliminate phone number oddities
###
cleanPhone = (phoneNumber) ->
  return null if _(phoneNumber).isEmpty()
  #if not checker.inValidPhone phoneNumber
  cleanedNumber = phoneNumber.toLowerCase().replace(/\s+/g, '')
    .replace('/(0)+/', '') # remove national 0
    .replace(/^\+?011/, '')  # remove 011 prefixes, which are unecessary international dial codes
    .replace(/^\+?[0]+/, '') # remove leading zeroes, as it seems like something that causes problem, and libphonenumber removes anyways
    
  if not /\d+\-[A-Z]+\-?[A-Z]+/.test phoneNumber
    # remove anything but numbers or the plus sign or character 'x', which is often used for extensions
    cleanedNumber = cleanedNumber.replace(/[^\dx+]/g, '')
  cleanedNumber


###
# Best effort parse using a cleaned phone number and countryCode(optional)
###
# Handle phone numbers where a country code had been provided, but the phone number didn't
# work out for that particular country
# (In these cases, we've had the most success by first checking if the number is
# international "+", and if that doesn't work, check if prefixing "+1" works)
###
# Handle phone numbers, where we didn't have a country code to begin with
# a US number, by using a +1 prefix, and if that fails, prepend a + and try that)
###
tryParseNumber = (phoneNumber, countryCode) ->
  try
    parsedNumber = phoneUtil.parseAndKeepRawInput phoneNumber, countryCode
  catch error
    switch error?.message
      when 'Invalid country calling code', 'Invalid Number'
        try
          parsedNumber = phoneUtil.parseAndKeepRawInput "+1#{phoneNumber.replace('+', '')}", 'US'
        catch error
          try
            parsedNumber = phoneUtil.parseAndKeepRawInput "+#{phoneNumber.replace('+', '')}"
          catch e
            parsedNumber = phoneUtil.parseAndKeepRawInput "+1#{phoneNumber.replace('+', '')}", 'US'
            
      when 'The string supplied did not seem to be a phone number'
        return null
  
  countryCode = phoneUtil.getRegionCodeForNumber parsedNumber
  if phoneUtil.isValidNumberForRegion parsedNumber, countryCode
    return parsedNumber
  else
    try
      return phoneUtil.parseAndKeepRawInput "+#{phoneNumber.replace('+', '')}"
    catch e
      return null
      

phoneNumberDetails = (parsedNumber) ->
  getPhoneNumberType = (parsedNumber) ->
    PNT = libphonenumber.PhoneNumberType
    phoneNumberType = phoneUtil.getNumberType(parsedNumber)
    return "#{_.invert(PNT)[phoneNumberType]}" if phoneNumberType?

  countryCode = phoneUtil.getRegionCodeForNumber parsedNumber
  countryName = if countryCode of countryNames then countryNames[countryCode] else countryNames['ZZ']
  result =
    e164: phoneUtil.format parsedNumber, PNF.E164
    rfc3966: phoneUtil.format parsedNumber, PNF.RFC3966
    intl: phoneUtil.format(parsedNumber, PNF.INTERNATIONAL).replace('ext. ', 'x')
    national: phoneUtil.format parsedNumber, PNF.NATIONAL
    countryCode: countryCode
    countryName: countryName
    phoneType: getPhoneNumberType parsedNumber
    region: phoneUtil.getRegionCodeForNumber parsedNumber
    validNumberForRegion: phoneUtil.isValidNumberForRegion parsedNumber, countryCode
  result.hasExtension = 'x' in result.intl
  return result


module.exports =
  parseNumber: parseNumber
  cleanPhone: cleanPhone
