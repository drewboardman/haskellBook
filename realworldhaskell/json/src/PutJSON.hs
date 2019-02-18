module PutJSON
  ( renderJValue
  , putJValue
  ) where

import           Data.List  (intercalate)
import           SimpleJSON

renderJValue :: JValue -> String
renderJValue (JString s) = show s
renderJValue (JNumber n) = show n
renderJValue (JBool True) = "true"
renderJValue (JBool False) = "false"
renderJValue JNull = "null"
renderJValue (JObject object) = "{" ++ pairs object ++ "}"
  where
    pairs [] = ""
    pairs ps = intercalate ", " (map renderPair ps)
    renderPair (key, value) = show key ++ ": " ++ renderJValue value
renderJValue (JArray a) = "[" ++ values a ++ "]"
  where
    values [] = ""
    values vs = intercalate ", " (map renderJValue vs)

putJValue :: JValue -> IO ()
putJValue jvalue = putStrLn (renderJValue jvalue)
