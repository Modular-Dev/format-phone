InternationalUKTestNumbers = [
  {
    should: 'mobile GB number w/spaces and plus sign'
    number: ['+44(0)777 55 55 613']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'MOBILE'
   ]
  }
  {
    should: 'mobile GB number - no spaces - w/ country code'
    number: ['+44(0)7775555613']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'MOBILE'
   ]
  }
  {
    should: 'London number'
    number: ['+44 20 7529 4600']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'London number'
    number: ['+44 (0) 20 7529 4600']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'Cardiff number'
    number: ['+44 29 1234 5678']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'Leeds number'
    number: ['+44 113 123 4567']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'Leicester number'
    number: ['+44 116 123 4567']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'Edinburgh number'
    number: ['+44 131 123 4567']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'Liverpool number'
    number: ['+44 151 123 4567']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'Evesham number'
    number: ['+44 1386 234567']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'Oxford number'
    number: ['+44 1865 123456']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'Swansea number'
    number: ['+44 1792 123456']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'Bolton number'
    number: ['+44 1204 123456']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'Sedbergh number'
    number: ['+44 15396 12345']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'Brampton number'
    number: ['+44 16977 12345']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
]

module.exports = InternationalUKTestNumbers
