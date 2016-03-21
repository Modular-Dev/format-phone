FakeTestNumbers = [
  {
    should: 'All zero\'s with plus sign- invalid phone number'
    number: ['+00000000000']
    expect: null
  }
  {
    should: 'Super fake'
    number: ['(555)-555-5555']
    expect: null
  }
  {
    should: 'All leading zero\'s - invalid phone number'
    number: ['00000000001']
    expect: null
  }
  {
    should: 'Number with plus sign in middle'
    number: ['123+1234567890']
    expect: null
  }
  {
    should: 'Number that\'s too long'
    number: ['+12345678909999999999']
    expect: null
  }
  {
    should: 'Invalid Alpha-numeric number'
    number: ['+1234567890AAAAAAAAAA']
    expect: null
  }
  {
    should: 'Looks like a number but has a foward slash'
    number: ['(012) 123/1234']
    expect: null
  }
  {
    should: 'Starts like a phone number but too long'
    number: ['(212) 123 12345234234234234234234']
    expect: null
  }
  {
    should: 'Looks like a valid number but in reverse format'
    number: ['(123)-1234-123']
    expect: null
  }  
  {
    should: 'Invalid number with leading zero and dash'
    number: ['0-212364345']
    expect: null
  }
  {
    should: 'Invalid number-kinda not real - but sort of real'
    number: ['123-1234']
    expect: null
  }
  {
    should: 'Invalid number - incomplete'
    number: ['+1 (617) 603-23xx']
    expect: null
  }
]

module.exports = FakeTestNumbers