_ = require 'lodash'
fs = require 'fs'
changeCase = require 'change-case'
FormatPhone = require('../src/index')
assert = require 'assert'
  

moduleLoader = () ->
  walk: (path) ->
    self = this
    modules = []
    fs.readdirSync(path).forEach (file) ->
      newPath = path + '/' + file
      stat = fs.statSync(newPath)
      if stat.isFile()
        if /(.*)\.(js|coffee)/.test(file)
          module = changeCase.pascalCase(file.replace(/\.(js|coffee)/, ''))
          modules.push
            name: module
            file: file
            title: changeCase.titleCase(file.replace(/\.(js|coffee)/, '')).toUpperCase(0)
      else if stat.isDirectory()
        self.walk newPath
      return
    return modules

getParsedNumber = (numberToTest) ->
  phoneNumber = numberToTest.number[0]
  countryCode = numberToTest.number[1]
  parsednumber = FormatPhone.parsePhoneNumber phoneNumber, countryCode
  parsednumber

validateResults = (numberToTest, parsednumber) ->
  if _.isArray numberToTest.expect
    _.map numberToTest.expect, (expected) ->
      _.mapKeys expected, (v, k) ->
        assert.equal parsednumber[k], v if parsednumber[k]
  else
     assert.equal numberToTest.expect, parsednumber if parsednumber
  

module.exports =
  moduleLoader: moduleLoader
  getParsedNumber: getParsedNumber
  validateResults: validateResults