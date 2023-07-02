module World (CTX, initContext, updateWorld) where

import Diagrams.Backend.Cairo
import Diagrams.Prelude
import ToDiagram

data CTX = CTX !Int !(Int -> Diagram B)

instance ToDiagram CTX where
  toDiagram (CTX n f) = f (1 + n `div` 10 `mod` 6)

hilbert :: Int -> Diagram B
hilbert 0 = mempty
hilbert n = (hilbert  (n-1) # alignB ||| hrule 1 ||| hilbert  (n-1) # alignB) # centerX
        ===
        (vrule 1 === (hilbert (n-1) # rotateBy (-1/4) # alignL) ||| strutX 1 ||| (vrule 1 === hilbert (n-1) # rotateBy (1/4) # alignR)) # centerX

initContext :: CTX
initContext = CTX 0 (bgFrame 0.1 white . hilbert)

updateWorld :: Float -> CTX -> IO CTX
updateWorld _ (CTX n d) = return $ CTX (n+1) d