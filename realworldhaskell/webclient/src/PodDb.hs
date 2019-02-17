module PodDb where

import           Control.Monad         (when)
import           Data.List             (sort)
import           Database.HDBC
import           Database.HDBC.Sqlite3
import           PodTypes

connect :: FilePath -> IO Connection
