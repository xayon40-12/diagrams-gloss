module ToDiagram (ToDiagram(..)) where

import Diagrams.Backend.Cairo
import Diagrams.Prelude

class ToDiagram a where
    toDiagram :: a -> Diagram B

