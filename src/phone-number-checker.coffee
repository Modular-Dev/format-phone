_ = require 'lodash'
negativeFilters = require './negative-filters'

isDigit = (c) ->
  return ("01234567890".indexOf(c) >= 0)

isInternationalPrefix = (text) ->
  text = text.replace(/¶| |/g, "")
  _.some filters, (filter, key) ->
    filter text
    

inValidPhone = (text) ->
  text = text.replace(/¶| |/g, "")
  _.some negativeFilters, (filter, key) ->
    isInvalid = filter text
    isInvalid


module.exports =
  inValidPhone: inValidPhone
  isDigit: isDigit
  isInternationalPrefix: isInternationalPrefix