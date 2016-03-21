InternationalTestNumbers = [
  {
    should: 'landline New Zealand (NZ) number /no countryCode w/ plus sign'
    number: ['+64 6 833 6001']
    expect: [ 
      countryCode: 'NZ'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Argentina (AR) number /no country code'
    number: ['+011 54 11 4727 1158']
    expect: [ 
      countryCode: 'AR'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'landline Denmark (DK) number /no country code'
    number: ['+0045 30822784']
    expect: [ 
      countryCode: 'DK'
   ]
  }
  {
    should: 'landline Denmark (DK) number'
    number: ['+00 (45) 3268-8422']
    expect: [ 
      countryCode: 'DK'
   ]
  }
  {
    should: 'Singapore (SG) number'
    number: ['+6568764880']
    expect: [ 
      countryCode: 'SG'
   ]
  }
]

module.exports = InternationalTestNumbers

