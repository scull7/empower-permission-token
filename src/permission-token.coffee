
DEFAULT_ACTION  = '*'

# type alias PermissionToken = String
PermissionToken = (str) -> str

# _dropLastChar :: String -> String
_dropLastChar   = (str) -> str.substring 0, str.length - 1

# _actionOrDefault :: String -> String
actionOrDefault = (str, defaultAction = DEFAULT_ACTION) ->
  if isAction str then (_dropLastChar str) else defaultAction

# getLastItem :: PermissionToken -> String
getLastItem     = (token) -> (token.split ':').pop()

# isAction :: String -> Bool
isAction        = (str) -> (str.substr -1) is '!'

# hasAction :: String -> Bool
hasAction       = (token) -> isAction (getLastItem token)

# getAction :: PermissionToken -> String
getAction       = (token, defaultAction = DEFAULT_ACTION) ->
  actionOrDefault (getLastItem token), defaultAction

# addAction :: PermissionToken -> String -> PermissionToken
addAction       = (token, action) -> token + ':' + action + '!'

module.exports  =
  PermissionToken : PermissionToken
  getLastItem     : getLastItem
  isAction        : isAction
  hasAction       : hasAction
  getAction       : getAction
  addAction       : addAction
  actionOrDefault : actionOrDefault
