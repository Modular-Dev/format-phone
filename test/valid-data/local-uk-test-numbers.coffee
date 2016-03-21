LocalUKTestNumbers = [
  {
    should: 'landline London number'
    number: ['(020) 1234 5678', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Cardiff number'
    number: ['(029) 1234 5678', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Leeds number'
    number: ['(0113) 123 4567', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Leicester number'
    number: ['(0116) 123 4567', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Edinburgh number'
    number: ['(0131) 123 4567', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Liverpool number'
    number: ['(0151) 123 4567', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Dundee number'
    number: ['(01382) 123456', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Evesham number'
    number: ['(01386) 123456', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Oxford number'
    number: ['(01865) 123456', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Swansea number'
    number: ['(01792) 123456', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Bolton number'
    number: ['(01204) 123456', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Brampton number'
    number: ['(016977) 12345', 'GB']
    expect: [ 
      countryCode: 'GB'
      phoneType: 'FIXED_LINE'
   ]
  }
]

module.exports = LocalUKTestNumbers