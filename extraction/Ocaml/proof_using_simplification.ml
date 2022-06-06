
type __ = Obj.t
let __ = let rec f _ = Obj.repr f in Obj.repr f

type bool =
| True
| False

type nat =
| O
| S of nat

(** val add : nat -> nat -> nat **)

let rec add n m =
  match n with
  | O -> m
  | S p -> S (add p m)

(** val mul : nat -> nat -> nat **)

let rec mul n m =
  match n with
  | O -> O
  | S p -> add m (mul p m)

(** val sub : nat -> nat -> nat **)

let rec sub n m =
  match n with
  | O -> n
  | S k -> (match m with
            | O -> n
            | S l -> sub k l)

(** val plus_O_n : __ **)

let plus_O_n =
  __

module Playground_rivi =
 struct
  (** val plus : nat -> nat -> nat **)

  let rec plus n m =
    match n with
    | O -> m
    | S n' -> S (plus n' m)

  (** val mult : nat -> nat -> nat **)

  let rec mult n m =
    match n with
    | O -> O
    | S n' -> plus m (mult n' m)

  (** val minus : nat -> nat -> nat **)

  let rec minus n m =
    match n with
    | O -> O
    | S n' -> (match m with
               | O -> n
               | S m' -> minus n' m')

  (** val beq_nat : nat -> nat -> bool **)

  let rec beq_nat n m =
    match n with
    | O -> (match m with
            | O -> True
            | S _ -> False)
    | S n' -> (match m with
               | O -> False
               | S m' -> beq_nat n' m')
 end
