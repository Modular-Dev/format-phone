(function() {
  var _, inValidPhone, isDigit, isInternationalPrefix, negativeFilters;

  _ = require('lodash');

  negativeFilters = require('./negative-filters');

  isDigit = function(c) {
    return "01234567890".indexOf(c) >= 0;
  };

  isInternationalPrefix = function(text) {
    text = text.replace(/¶| |/g, "");
    return _.some(filters, function(filter, key) {
      return filter(text);
    });
  };

  inValidPhone = function(text) {
    text = text.replace(/¶| |/g, "");
    return _.some(negativeFilters, function(filter, key) {
      var isInvalid;
      isInvalid = filter(text);
      return isInvalid;
    });
  };

  module.exports = {
    inValidPhone: inValidPhone,
    isDigit: isDigit,
    isInternationalPrefix: isInternationalPrefix
  };

}).call(this);
