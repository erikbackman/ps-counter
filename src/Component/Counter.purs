module Component.Counter where

import Prelude

import Data.Maybe (Maybe(..))
import Halogen (Component, defaultEval, mkComponent, mkEval, modify_)
import Halogen.HTML (HTML, div_, p_, button, text)
import Halogen.HTML.Events (onClick)

data Action = Increment | Decrement
type State = Int 
  
component :: forall q i o m. Component HTML q i o m
component =
  mkComponent
    { initialState: const 0
    , render: render 
    , eval: mkEval defaultEval
      { handleAction = handleAction
      }
    }
    where
      render state =
        div_
        [ p_
          [ text (show state)
          , button [ onClick \_ -> Just Decrement ] [ text "-" ]
          , button [ onClick \_ -> Just Increment ] [ text "+" ]  
          ]
        ]

      handleAction = case _ of
        Decrement -> modify_ \s -> s - 1
        Increment -> modify_ \s -> s + 1 