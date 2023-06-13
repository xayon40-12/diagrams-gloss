module World (CTX, initContext, updateWorld) where

import Diagrams.Backend.Cairo
import Diagrams.Prelude

type CTX = Diagram B

initContext :: CTX
initContext = bgFrame 0.1 white $ circle 1 === square 1

updateWorld :: Float -> CTX -> IO CTX
updateWorld _ = return