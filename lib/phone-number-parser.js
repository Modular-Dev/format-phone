(function() {
  var PNF, _, checker, cleanPhone, countryNames, getPhoneDetails, libphonenumber, parseNumber, phoneNumberDetails, phoneUtil, tryParseNumber,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  _ = require('lodash');

  libphonenumber = require('google-libphonenumber');

  exports.PNF = PNF = libphonenumber.PhoneNumberFormat;

  exports.util = phoneUtil = libphonenumber.PhoneNumberUtil.getInstance();

  countryNames = require('./resources/en/country_names');

  checker = require('./phone-number-checker');


  /*
   * Parse just a single phone number
   */

  parseNumber = function(originalNumber, countryCode) {
    var cleanedNumber, parsedNumber;
    if (_(originalNumber).isEmpty()) {
      return null;
    }
    cleanedNumber = cleanPhone(originalNumber);
    if (checker.inValidPhone(cleanedNumber)) {
      return null;
    }
    parsedNumber = tryParseNumber(cleanedNumber, countryCode);
    if (!parsedNumber) {
      return null;
    }
    if (!phoneUtil.isPossibleNumber(parsedNumber)) {
      return null;
    }
    if (!phoneUtil.isValidNumber(parsedNumber)) {
      return null;
    }
    return getPhoneDetails(parsedNumber);
  };

  getPhoneDetails = function(parsedNumber) {
    var countryCode, phoneDetails;
    phoneDetails = phoneNumberDetails(parsedNumber);
    countryCode = phoneUtil.getRegionCodeForNumber(parsedNumber);
    return phoneDetails;
  };


  /*
   * Eliminate phone number oddities
   */

  cleanPhone = function(phoneNumber) {
    var cleanedNumber;
    if (_(phoneNumber).isEmpty()) {
      return null;
    }
    cleanedNumber = phoneNumber.toLowerCase().replace(/\s+/g, '').replace('/(0)+/', '').replace(/^\+?011/, '').replace(/^\+?[0]+/, '');
    if (!/\d+\-[A-Z]+\-?[A-Z]+/.test(phoneNumber)) {
      cleanedNumber = cleanedNumber.replace(/[^\dx+]/g, '');
    }
    return cleanedNumber;
  };


  /*
   * Best effort parse using a cleaned phone number and countryCode(optional)
   */


  /*
   * Handle phone numbers, where we didn't have a country code to begin with
   * a US number, by using a +1 prefix, and if that fails, prepend a + and try that)
   */

  tryParseNumber = function(phoneNumber, countryCode) {
    var e, error, error1, error2, error3, error4, parsedNumber;
    try {
      parsedNumber = phoneUtil.parseAndKeepRawInput(phoneNumber, countryCode);
    } catch (error1) {
      error = error1;
      switch (error != null ? error.message : void 0) {
        case 'Invalid country calling code':
        case 'Invalid Number':
          try {
            parsedNumber = phoneUtil.parseAndKeepRawInput("+1" + (phoneNumber.replace('+', '')), 'US');
          } catch (error2) {
            error = error2;
            try {
              parsedNumber = phoneUtil.parseAndKeepRawInput("+" + (phoneNumber.replace('+', '')));
            } catch (error3) {
              e = error3;
              parsedNumber = phoneUtil.parseAndKeepRawInput("+1" + (phoneNumber.replace('+', '')), 'US');
            }
          }
          break;
        case 'The string supplied did not seem to be a phone number':
          return null;
      }
    }
    countryCode = phoneUtil.getRegionCodeForNumber(parsedNumber);
    if (phoneUtil.isValidNumberForRegion(parsedNumber, countryCode)) {
      return parsedNumber;
    } else {
      try {
        return phoneUtil.parseAndKeepRawInput("+" + (phoneNumber.replace('+', '')));
      } catch (error4) {
        e = error4;
        return null;
      }
    }
  };

  phoneNumberDetails = function(parsedNumber) {
    var countryCode, countryName, getPhoneNumberType, result;
    getPhoneNumberType = function(parsedNumber) {
      var PNT, phoneNumberType;
      PNT = libphonenumber.PhoneNumberType;
      phoneNumberType = phoneUtil.getNumberType(parsedNumber);
      if (phoneNumberType != null) {
        return "" + (_.invert(PNT)[phoneNumberType]);
      }
    };
    countryCode = phoneUtil.getRegionCodeForNumber(parsedNumber);
    countryName = countryCode in countryNames ? countryNames[countryCode] : countryNames['ZZ'];
    result = {
      e164: phoneUtil.format(parsedNumber, PNF.E164),
      rfc3966: phoneUtil.format(parsedNumber, PNF.RFC3966),
      intl: phoneUtil.format(parsedNumber, PNF.INTERNATIONAL).replace('ext. ', 'x'),
      national: phoneUtil.format(parsedNumber, PNF.NATIONAL),
      countryCode: countryCode,
      countryName: countryName,
      phoneType: getPhoneNumberType(parsedNumber),
      region: phoneUtil.getRegionCodeForNumber(parsedNumber),
      validNumberForRegion: phoneUtil.isValidNumberForRegion(parsedNumber, countryCode)
    };
    result.hasExtension = indexOf.call(result.intl, 'x') >= 0;
    return result;
  };

  module.exports = {
    parseNumber: parseNumber,
    cleanPhone: cleanPhone
  };

}).call(this);
