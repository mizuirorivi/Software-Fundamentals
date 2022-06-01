
type day =
| Monday
| Tuesday
| Wednesday
| Thursday
| Friday
| Saturday
| Sunday

(** val next_weekday : day -> day **)

let next_weekday = function
| Monday -> Tuesday
| Tuesday -> Wednesday
| Wednesday -> Thursday
| Thursday -> Friday
| _ -> Monday
