Inductive day : Type :=
  | monday : day
  | tuesday : day
  | wednesday : day
  | thursday : day
  | friday : day
  | saturday : day
| sunday : day.

Definition next_weekday (d:day) : day :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => monday
  | saturday => monday
  | sunday => monday
  end.

Eval simpl in (next_weekday friday).
Eval simpl in (next_weekday (next_weekday saturday)).

Example test_next_weekday:
  (next_weekday (next_weekday saturday)) = tuesday.

Proof. simpl. reflexivity. Qed.


(* Haskell への エクスポート *)
Require Extraction.
Extraction Language Haskell.
Extraction "../extraction/Haskell/test.hs" day next_weekday.
(**************************)

(* Ocaml への エクスポート *)
Require Extraction.
Extraction Language OCaml.
Extraction "../extraction/Ocaml/test.ml" day next_weekday.
(**************************)

(* JSON への エクスポート *)
  
Require Extraction.
Extraction Language JSON.
Extraction "../extraction/JSON/test.json" day next_weekday.
(**************************)
