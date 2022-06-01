module Test where

import qualified Prelude

data Day =
   Monday
 | Tuesday
 | Wednesday
 | Thursday
 | Friday
 | Saturday
 | Sunday

next_weekday :: Day -> Day
next_weekday d =
  case d of {
   Monday -> Tuesday;
   Tuesday -> Wednesday;
   Wednesday -> Thursday;
   Thursday -> Friday;
   _ -> Monday}

