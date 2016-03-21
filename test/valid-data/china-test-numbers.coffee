ChinaTestNumbers = [
  {
    should: 'mobile China (CN) number'
    number: ['+86 189 6902 0603']
    expect: [ 
      countryCode: 'CN'
      phoneType: 'MOBILE'
   ]
  }
  {
    should: 'mobile China (CN) number'
    number: ['+8618918682107']
    expect: [ 
      countryCode: 'CN'
      phoneType: 'MOBILE'
   ]
  }
  {
    should: 'mobile China (CN) number'
    number: ['+8615229253024']
    expect: [ 
      countryCode: 'CN'
      phoneType: 'MOBILE'
   ]
  }
  {
    should: 'Beijing landline'
    number: ['+861057684020']
    expect: [ 
      countryCode: 'CN'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'shanghai landline'
    number: ['862154170345']
    expect: [ 
      countryCode: 'CN'
      phoneType: 'FIXED_LINE'
   ]
  }
  {
    should: 'mobile hong kong'
    number: ['+85260700179']
    expect: [ 
      countryCode: 'HK'
      phoneType: 'MOBILE'
   ]
  }
]
module.exports = ChinaTestNumbers


