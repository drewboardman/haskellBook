{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_beamtutorial (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/drew/.cabal/bin"
libdir     = "/home/drew/.cabal/lib/x86_64-linux-ghc-8.6.3/beamtutorial-0.1.0.0-inplace-beamtutorial"
dynlibdir  = "/home/drew/.cabal/lib/x86_64-linux-ghc-8.6.3"
datadir    = "/home/drew/.cabal/share/x86_64-linux-ghc-8.6.3/beamtutorial-0.1.0.0"
libexecdir = "/home/drew/.cabal/libexec/x86_64-linux-ghc-8.6.3/beamtutorial-0.1.0.0"
sysconfdir = "/home/drew/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "beamtutorial_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "beamtutorial_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "beamtutorial_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "beamtutorial_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "beamtutorial_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "beamtutorial_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
