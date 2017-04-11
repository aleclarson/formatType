
formatType = (type, startWithArticle) ->

  string =
    if Array.isArray type
    then formatTypes type
    else getName type

  if startWithArticle
  then prependArticle string
  else string

module.exports = formatType

#
# Helpers
#

formatTypes = (types) ->
  {length} = types

  if length is 1
    return getName types[0]

  names = types.map getName

  if length is 2
    return names.join " or "

  names.push "or " + names.pop()
  return names.join ", "

getName = (type) ->
  type.displayName or type.name or null

vowels = "aeiou"
prependArticle = (string) ->
  if 0 > vowels.indexOf string[0].toLowerCase()
  then "a " + string
  else "an " + string
