module Main (main) where

import Graphics.Gloss.Interface.IO.Game
import Window
import World

main :: IO ()
main = do
  playIO window white 60 initContext draw input update

