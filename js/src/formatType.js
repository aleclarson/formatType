var addArticle, formatTypeNames, getTypeName, inArray, vowels;

inArray = require("in-array");

module.exports = function(type, startWithArticle) {
  var result;
  if (Array.isArray(type)) {
    result = formatTypeNames(type);
  } else {
    result = getTypeName(type);
  }
  if (startWithArticle) {
    result = addArticle(result);
  }
  return result;
};

vowels = ["a", "e", "i", "o", "u"];

addArticle = function(string) {
  if (inArray(vowels, string[0].toLowerCase())) {
    return "an " + string;
  }
  return "a " + string;
};

formatTypeNames = function(types, options) {
  var i, lastType, len, type, typeCount, typeNames;
  typeNames = [];
  for (i = 0, len = types.length; i < len; i++) {
    type = types[i];
    typeNames.push(getTypeName(type));
  }
  typeCount = typeNames.length;
  if (typeCount === 1) {
    return typeNames[0];
  } else if (typeCount === 2) {
    return typeNames[0] + " or " + typeNames[1];
  }
  lastType = typeNames.pop();
  return typeNames.join(", ") + ", or " + lastType;
};

getTypeName = function(type, options) {
  if (type.name) {
    return type.name;
  }
  if (type.getName) {
    return type.getName();
  }
  return "[unknown type]";
};

//# sourceMappingURL=../../map/src/formatType.map
