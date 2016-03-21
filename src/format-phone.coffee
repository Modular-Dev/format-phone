_ = require 'lodash'
parser = require './phone-number-parser'

FormatPhone =  
  parsePhoneNumber: (text, countryCode) ->
    return null if text.length < 0 or text == ''
    parser.parseNumber(text, countryCode)

  cleanPhone: (text) ->
    return parser.cleanPhone text

# Establish the root object, `window` (`self`) in the browser, `global`
# on the server, or `this` in some virtual machines. We use `self`
# instead of `window` for `WebWorker` support.
root = typeof self == 'object' and self.self == self and self or typeof global == 'object' and global.global == global and global or this

# Export the FormatPhone object for **Node.js**, with
# backwards-compatibility for their old module API. If we're in
# the browser, add `FormatPhone` as a global object.
# (`nodeType` is checked to ensure that `module`
# and `exports` are not HTML elements.)
if typeof exports != 'undefined' and !exports.nodeType
  exports.FormatPhone = FormatPhone
if typeof module != 'undefined' and !module.nodeType and module.exports
  exports = module.exports = FormatPhone

root.FormatPhone = FormatPhone
