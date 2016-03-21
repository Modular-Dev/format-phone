(function() {
  var FormatPhone, _, exports, parser, root;

  _ = require('lodash');

  parser = require('./phone-number-parser');

  FormatPhone = {
    parsePhoneNumber: function(text, countryCode) {
      if (text.length < 0 || text === '') {
        return null;
      }
      return parser.parseNumber(text, countryCode);
    },
    cleanPhone: function(text) {
      return parser.cleanPhone(text);
    }
  };

  root = typeof self === 'object' && self.self === self && self || typeof global === 'object' && global.global === global && global || this;

  if (typeof exports !== 'undefined' && !exports.nodeType) {
    exports.FormatPhone = FormatPhone;
  }

  if (typeof module !== 'undefined' && !module.nodeType && module.exports) {
    exports = module.exports = FormatPhone;
  }

  root.FormatPhone = FormatPhone;

}).call(this);
