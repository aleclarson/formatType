
# formatType 1.0.0 ![stable](https://img.shields.io/badge/stability-stable-4EBA0F.svg?style=flat)

Returns a `String` representing the display name of the given type(s).

Also compatible with any [`Validator`](https://github.com/aleclarson/Validator).

```coffee
formatType = require "formatType"

formatType Array                             # => "Array"

formatType Array, yes                        # => "an Array"

formatType [ Number, String ]                # => "Number or String"

formatType [ Void, Object, Kind(Function) ]  # => "Void, Object, or kind of Function"
```
