negativeFilters =
  textTooLong: (text) -> text.length > 16
  textTooShort: (text) -> text.length < 10
  bogusNumber: (text) -> /\(?555\)?-?555-?5555/g.test text
  bogusNumberWithDashes: (text) -> /000-000-0000/g.test text
  yearsRange: (text) -> /(18|19|20)\d{2}\-(18|19|20)\d{2}\b/.test text
  ISODate: (text) -> /(18|19|20)\d{2}\-([0-1]\d)-([0-3]\d)\b/.test text
  date: (text) -> /^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}$/.test text
  ipAddress: (text) -> /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/.test text
  decimalNumber: (text) -> /^\d*\.\d*$/.test text
  twoSeperators: (text) -> /[\(\)\.\-][\(\)\.\-]/.test text
  commas: (text) -> /\d+\-?\d+\,\d+/.test text

module.exports = negativeFilters