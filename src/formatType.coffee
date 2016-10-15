
inArray = require "in-array"

module.exports = (type, startWithArticle) ->

  if Array.isArray type
    result = formatTypeNames type

  else result = getTypeName type

  if startWithArticle
    result = addArticle result

  return result

vowels = [ "a", "e", "i", "o", "u" ]

addArticle = (string) ->

  if inArray vowels, string[0].toLowerCase()
    return "an " + string

  return "a " + string

formatTypeNames = (types, options) ->

  typeNames = []

  for type in types
    typeNames.push getTypeName type

  typeCount = typeNames.length

  if typeCount is 1
    return typeNames[0]

  else if typeCount is 2
    return typeNames[0] + " or " + typeNames[1]

  lastType = typeNames.pop()
  return typeNames.join(", ") + ", or " + lastType

getTypeName = (type, options) ->

  if type.name
    return type.name

  if type.getName
    return type.getName()

  return "[unknown type]"
