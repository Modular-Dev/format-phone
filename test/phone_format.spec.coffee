_ = require 'lodash'
fs = require 'fs'
helpers = require './helpers.coffee'


###*
# Test `FormatPhone`
###


describe 'FormatPhone number parser', () ->
  describe 'Valid number tests', () ->
    modules = helpers.moduleLoader().walk(__dirname + '/valid-data')
    _.each modules, (module) ->
      numbers = require "./valid-data/#{module.file}"
      describe "#{module.title}", () ->
        _.each numbers, (numberToTest) ->
          it "#{numberToTest.should} - #{numberToTest.number}", () ->
            parsednumber = helpers.getParsedNumber(numberToTest)
            helpers.validateResults numberToTest, parsednumber
          return

  describe 'Invalid number tests', () ->
    modules = helpers.moduleLoader().walk(__dirname + '/fake-data')
    _.each modules, (module) ->
      numbers = require "./fake-data/#{module.file}"
      describe "#{module.title}", () ->
        _.each numbers, (numberToTest) ->
          it "#{numberToTest.should} - #{numberToTest.number}", ->
            if numberToTest.throws
              expect ->
                parsednumber = helpers.getParsedNumber(numberToTest)
              .to.throw numberToTest.throws
            else
              parsednumber = helpers.getParsedNumber(numberToTest)
              helpers.validateResults numberToTest, parsednumber
          return