(function() {
  var negativeFilters;

  negativeFilters = {
    textTooLong: function(text) {
      return text.length > 16;
    },
    textTooShort: function(text) {
      return text.length < 10;
    },
    bogusNumber: function(text) {
      return /\(?555\)?-?555-?5555/g.test(text);
    },
    bogusNumberWithDashes: function(text) {
      return /000-000-0000/g.test(text);
    },
    yearsRange: function(text) {
      return /(18|19|20)\d{2}\-(18|19|20)\d{2}\b/.test(text);
    },
    ISODate: function(text) {
      return /(18|19|20)\d{2}\-([0-1]\d)-([0-3]\d)\b/.test(text);
    },
    date: function(text) {
      return /^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}$/.test(text);
    },
    ipAddress: function(text) {
      return /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/.test(text);
    },
    decimalNumber: function(text) {
      return /^\d*\.\d*$/.test(text);
    },
    twoSeperators: function(text) {
      return /[\(\)\.\-][\(\)\.\-]/.test(text);
    },
    commas: function(text) {
      return /\d+\-?\d+\,\d+/.test(text);
    }
  };

  module.exports = negativeFilters;

}).call(this);
