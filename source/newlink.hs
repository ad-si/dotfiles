#! /usr/bin/env runhaskell

import System.IO (putStr, hFlush, stdout)
import Data.Time (getCurrentTime, formatTime, defaultTimeLocale)
import Control.Monad (join)


linkDir :: String
linkDir = "/Users/adrian/Dropbox (Personal)/Links"


putAndFlush :: String -> IO ()
putAndFlush value = do
  putStr value
  hFlush stdout


main :: IO ()
main = do
  putAndFlush "url: "
  url <- getLine

  putAndFlush "title: "
  title <- getLine

  putAndFlush "description: "
  description <- getLine

  putAndFlush "tags (comma separated): "
  tags <- getLine

  now <- getCurrentTime

  let
    dateFormat = "%Y-%m-%dt%H%M"
    dateTime = formatTime defaultTimeLocale dateFormat now
    content =
      ("title: " ++ title) :
      ("description: " ++ description) :
      ("url: " ++ url) :
      ("tags: [" ++ tags ++ "]") :
      []
    filePath = linkDir ++ "/" ++ "dateTime" ++ ".yaml"

  writeFile filePath (unlines content)

  putStrLn ("Wrote file " ++ filePath)
