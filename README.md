# format-phone [![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Dependency Status][daviddm-image]][daviddm-url] [![Coverage percentage][coveralls-image]][coveralls-url]

A library that attempts to simplify and assist in dealing with phone number formats including international numbers. 
Piggybacks off the google libphonenumber library for the heavy lifting and adds some syntactical sugar. 



## Installation

```sh
$ npm install --save format-phone
```

## Usage

```js
var formatPhone = require('format-phone');

formatPhone('Rainbow');


### Development

source location: ./app/scripts

language: CoffeeScript

build system: gulp (browserify, coffeelint)


###### Directory structure

![alt text](https://github.com/fbatroni/format-phone/raw/master/common/images/tree.png "App directory structure")


## Testing

CI provided by TravisCI

`npm test`

##### Example test results

```
FormatPhone number parser
  Valid number tests
    CHINA TEST NUMBERS
      ✓ mobile China (CN) number - +86 189 6902 0603
      ✓ mobile China (CN) number - +8618918682107
      ✓ mobile China (CN) number - +8615229253024
      ✓ Beijing landline - +861057684020
      ✓ shanghai landline - 862154170345
      ✓ mobile hong kong - +85260700179
    INTERNATIONAL TEST NUMBERS
      ✓ landline New Zealand (NZ) number /no countryCode w/ plus sign - +64 6 833 6001
      ✓ landline Argentina (AR) number /no country code - +011 54 11 4727 1158
      ✓ landline Denmark (DK) number /no country code - +0045 30822784
      ✓ landline Denmark (DK) number - +00 (45) 3268-8422
      ✓ Singapore (SG) number - +6568764880
    INTERNATIONAL TEST UK NUMBERS
      ✓ mobile GB number w/spaces and plus sign - +44(0)777 55 55 613
      ✓ mobile GB number - no spaces - w/ country code - +44(0)7775555613
      ✓ London number - +44 20 7529 4600
      ✓ London number - +44 (0) 20 7529 4600
      ✓ Cardiff number - +44 29 1234 5678
      ✓ Leeds number - +44 113 123 4567
      ✓ Leicester number - +44 116 123 4567
      ✓ Edinburgh number - +44 131 123 4567
      ✓ Liverpool number - +44 151 123 4567
      ✓ Evesham number - +44 1386 234567
      ✓ Oxford number - +44 1865 123456
      ✓ Swansea number - +44 1792 123456
      ✓ Bolton number - +44 1204 123456
      ✓ Sedbergh number - +44 15396 12345
      ✓ Brampton number - +44 16977 12345
    LOCAL UK TEST NUMBERS
      ✓ landline London number - (020) 1234 5678,GB
      ✓ landline Cardiff number - (029) 1234 5678,GB
      ✓ landline Leeds number - (0113) 123 4567,GB
      ✓ landline Leicester number - (0116) 123 4567,GB
      ✓ landline Edinburgh number - (0131) 123 4567,GB
      ✓ landline Liverpool number - (0151) 123 4567,GB
      ✓ landline Dundee number - (01382) 123456,GB
      ✓ landline Evesham number - (01386) 123456,GB
      ✓ landline Oxford number - (01865) 123456,GB
      ✓ landline Swansea number - (01792) 123456,GB
      ✓ landline Bolton number - (01204) 123456,GB
      ✓ landline Brampton number - (016977) 12345,GB
    US TEST NUMBERS
      ✓ US number /no countryCode /no plus sign - 9179951689
      ✓ Number with forward and back slashes - parses to a valid number - 0212\345/6789
      ✓ US number /with countryCode - dots - 917.291.5910,US
      ✓ US number /with leading 011 /no spaces - 0113106999684,US
      ✓ US number - 8886563726
      ✓ US number /with extension /no plus sign - 203.866.8886 x111
      ✓ US number alpha-numeric - 1800-ALPHNUM
      ✓ Number with dash and comma - parses to a valid number - 1212-364,4321
      ✓ Number with forward and back slashes - parses to a valid number - 0212\345/6789
  Invalid number tests
    FAKE TEST NUMBERS
      ✓ All zero's with plus sign- invalid phone number - +00000000000
      ✓ Super fake - (555)-555-5555
      ✓ All leading zero's - invalid phone number - 00000000001
      ✓ Number with plus sign in middle - 123+1234567890
      ✓ Number that's too long - +12345678909999999999
      ✓ Invalid Alpha-numeric number - +1234567890AAAAAAAAAA
      ✓ Looks like a number but has a foward slash - (012) 123/1234
      ✓ Starts like a phone number but too long - (212) 123 12345234234234234234234
      ✓ Looks like a valid number but in reverse format - (123)-1234-123
      ✓ Invalid number with leading zero and dash - 0-212364345
      ✓ Invalid number-kinda not real - but sort of real - 123-1234
      ✓ Invalid number - incomplete - +1 (617) 603-23xx

```

```
## License

MIT © [Fritz G. Batroni](https://fritzbatroni.wordpress.com/)


[npm-image]: https://badge.fury.io/js/format-phone.svg
[npm-url]: https://npmjs.org/package/format-phone
[travis-image]: https://travis-ci.org/fbatroni/format-phone.svg?branch=master
[travis-url]: https://travis-ci.org/fbatroni/format-phone
[daviddm-image]: https://david-dm.org/fbatroni/format-phone.svg?theme=shields.io
[daviddm-url]: https://david-dm.org/fbatroni/format-phone
[coveralls-image]: https://coveralls.io/repos/fbatroni/format-phone/badge.svg
[coveralls-url]: https://coveralls.io/r/fbatroni/format-phone
