module Window (window, draw, input, update) where

import World
import Graphics.Gloss.Interface.IO.Game
import Diagrams (Diagram)
import Diagrams.Backend.Cairo (B)
import Graphics.Gloss
import Diagrams.Backend.Cairo.Ptr (renderForeignPtr)
import System.Exit (exitSuccess)

toRGBA :: Int -> Int -> Diagram B -> IO Picture
toRGBA sx sy d = do
    ptr <- renderForeignPtr sx sy d
    return $ bitmapOfForeignPtr sx sy (BitmapFormat TopToBottom PxRGBA) ptr False

windowSize :: (Int, Int)
windowSize = (800, 800)

window :: Display
window = InWindow "Diagrams-Gloss" windowSize (0 ,0)


draw :: CTX -> IO Picture
draw = toRGBA sx sy
    where (sx, sy) = windowSize

input :: Event -> CTX -> IO CTX
input (EventKey (SpecialKey KeyEsc) Down _ _) c = exitSuccess >> return c
input _ c = return c

update :: Float -> CTX -> IO CTX
update = updateWorld

