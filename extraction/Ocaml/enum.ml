
type bool =
| True
| False

(** val negb : bool -> bool **)

let negb = function
| True -> False
| False -> True

(** val andb : bool -> bool -> bool **)

let andb b1 b2 =
  match b1 with
  | True -> b2
  | False -> False

(** val orb : bool -> bool -> bool **)

let orb b1 b2 =
  match b1 with
  | True -> True
  | False -> b2

(** val nandb : bool -> bool -> bool **)

let nandb b1 b2 =
  match andb b1 b2 with
  | True -> False
  | False -> True

(** val andb3 : bool -> bool -> bool -> bool **)

let andb3 b1 b2 b3 =
  andb (andb b1 b2) (andb b2 b3)
