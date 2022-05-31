module Bool where

import qualified Prelude

data Bool =
   True
 | False

negb :: Bool -> Bool
negb b =
  case b of {
   True -> False;
   False -> True}

andb :: Bool -> Bool -> Bool
andb b1 b2 =
  case b1 of {
   True -> b2;
   False -> False}

orb :: Bool -> Bool -> Bool
orb b1 b2 =
  case b1 of {
   True -> True;
   False -> b2}

