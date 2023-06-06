module Lib
    ( someFunc
    ) where

import Graphics.Gloss (Picture, Display (InWindow), bitmapOfForeignPtr, BitmapFormat (BitmapFormat), RowOrder (TopToBottom), PixelFormat (PxRGBA), white)
import Graphics.Gloss.Interface.IO.Game (playIO, Event (EventKey), Key (..), SpecialKey (..), KeyState (..))
import Diagrams.Backend.Cairo
import Diagrams
import Diagrams.Backend.Cairo.Ptr (renderForeignPtr)
import System.Exit (exitSuccess)

windowSize :: (Int, Int)
windowSize = (800, 800)

window :: Display
window = InWindow "Diagrams-Gloss" windowSize (0 ,0)

type CTX = Diagram B

initContext :: CTX
initContext = circle 1 === square 1

draw :: CTX -> IO Picture
draw = toRGBA sx sy
    where (sx, sy) = windowSize

toRGBA :: Int -> Int -> Diagram B -> IO Picture
toRGBA sx sy d = do
    ptr <- renderForeignPtr sx sy d
    return $ bitmapOfForeignPtr sx sy (BitmapFormat TopToBottom PxRGBA) ptr False

input :: Event -> CTX -> IO CTX
input (EventKey (SpecialKey KeyEsc) Down _ _) c = exitSuccess >> return c
input _ c = return c

update :: Float -> CTX -> IO CTX
update _ = return

someFunc :: IO ()
someFunc = do
  playIO window white 60 initContext draw input update

