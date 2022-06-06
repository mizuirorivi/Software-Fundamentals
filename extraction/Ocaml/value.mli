
type __ = Obj.t

type bool =
| True
| False

type nat =
| O
| S of nat

val add : nat -> nat -> nat

val mul : nat -> nat -> nat

val sub : nat -> nat -> nat

val plus_O_n : __

module Playground_rivi :
 sig
  val plus : nat -> nat -> nat

  val mult : nat -> nat -> nat

  val minus : nat -> nat -> nat

  val beq_nat : nat -> nat -> bool
 end
