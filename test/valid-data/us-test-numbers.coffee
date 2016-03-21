USTestNumbers = [
  {
    should: 'US number /no countryCode /no plus sign'
    number: ['9179951689']
    expect: [ 
      countryCode: 'US'
      phoneType: 'FIXED_LINE_OR_MOBILE'
   ]
  }
  {
    should: 'Number with forward and back slashes - parses to a valid number'
    number: ['0212\\345/6789']
    expect: [countryCode: 'US']
  }
  {
    should: 'US number /with countryCode - dots'
    number: ['917.291.5910', 'US']
    expect: [countryCode: 'US']
  }
  {
    should: 'US number /with leading 011 /no spaces'
    number: ['0113106999684', 'US']
    expect: [
      countryCode: 'US'
    ]
  }
  {
    should: 'US number'
    number: ['8886563726']
    expect: [countryCode: 'US']
  }
  {
    should: 'US number /with extension /no plus sign'
    number: ['203.866.8886 x111']
    expect: [
      countryCode: 'US'
      hasExtension: true
    ]
  }
  {
    should: 'US number alpha-numeric'
    number: ['1800-ALPHNUM']
    expect: [
      countryCode: 'US'
      hasExtension: true
    ]
  }
  {
    should: 'Number with dash and comma - parses to a valid number'
    number: ['1212-364,4321']
    expect: [countryCode: 'US']
  }
  {
    should: 'Number with forward and back slashes - parses to a valid number'
    number: ['0212\\345/6789']
    expect: [countryCode: 'US']
  }
]

module.exports = USTestNumbers

