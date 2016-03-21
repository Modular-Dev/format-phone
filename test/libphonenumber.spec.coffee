_ = require 'lodash'
should = require('chai').should()
libphonenumber = require 'google-libphonenumber'
phoneUtil = libphonenumber.PhoneNumberUtil.getInstance()
PNF = libphonenumber.PhoneNumberFormat
PNT = libphonenumber.PhoneNumberType
PNV = libphonenumber.PhoneNumberUtil.ValidationResult

###*
# Test `libphonenumber`
###

describe 'Core Google libphonenumber functions',  () ->
  
  validNumbers = [
    '202-456-1414'
    '(202) 456-1414'
    '+1 (202) 456-1414'
    '202.456.1414'
    '202/4561414'
    '1 202 456 1414'
    '+12024561414'
    '1 202-456-1414'
  ]

  describe 'International Format', ->
    it 'should format a number in the international format', ->
      validNumbers.forEach (value) ->
        phoneNumber = phoneUtil.parseAndKeepRawInput(value, 'US')
        phoneUtil.format(phoneNumber, PNF.INTERNATIONAL).should.equal '+1 202-456-1414'
        return
      return
    return
  describe 'E164 Format', ->
    it 'should format a number in the E164 format', ->
      validNumbers.forEach (value) ->
        phoneNumber = phoneUtil.parseAndKeepRawInput(value, 'US')
        phoneUtil.format(phoneNumber, PNF.E164).should.equal '+12024561414'
        return
      return
    return
  describe 'National Format', ->
    it 'should format a number in the national format', ->
      validNumbers.forEach (value) ->
        phoneNumber = phoneUtil.parseAndKeepRawInput(value, 'US')
        phoneUtil.format(phoneNumber, PNF.NATIONAL).should.equal '(202) 456-1414'
        return
      return
    return
  describe 'RFC3966 Format', ->
    it 'should format a number in the RFC3966 format', ->
      validNumbers.forEach (value) ->
        phoneNumber = phoneUtil.parseAndKeepRawInput(value, 'US')
        phoneUtil.format(phoneNumber, PNF.RFC3966).should.equal 'tel:+1-202-456-1414'
        return
      return
    return
  describe 'Phone Number Type', ->
    it 'should return a valid phone number type', ->
      phoneNumber = phoneUtil.parseAndKeepRawInput(validNumbers[0], 'US')
      phoneUtil.getNumberType(phoneNumber).should.equal PNT.FIXED_LINE_OR_MOBILE
      return
    return
  describe 'Malformatted Number', ->
    it 'should throw an error when attempting to format a malformatted number', ->
      try
        phoneUtil.parseAndKeepRawInput '111111111111111111111', 'US'
        should['default'].fail()
      catch e
        e.should.be.an.instanceOf Error
        e.message.should.equal 'The string supplied is too long to be a phone number'
      return
    it 'should return a reason for an invalid number', ->
      number = phoneUtil.parseAndKeepRawInput('123456', 'US')
      phoneUtil.isPossibleNumber(number).should.equal false
      phoneUtil.isPossibleNumberWithReason(number).should.equal PNV.TOO_SHORT
      return
    return
  return
     