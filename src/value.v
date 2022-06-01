Module Playground1.

Inductive nat : Type :=
| O : nat
| S : nat -> nat.

Definition pred (n: nat) : nat :=
  match n with
  | O => O
  | S n' => n'
  end.

End Playground1.

Definition minustwo (n : nat) : nat :=
  match n with
  | O => O
  | S O => O
  | S (S n') => n'
  end.

Check ( S (S (S (S O)))).
Eval simpl in (minustwo 4).

Check S.
Check pred.
Check minustwo.

Fixpoint evenb (n: nat) : bool :=
  match n with
  | O => true
  | S O => false
  | S (S n' ) => evenb n'
  end.

Definition oddb (n: nat) : bool := negb (evenb n).

Example test_oddb1: (oddb (S O)) = true.
Proof. simpl. reflexivity. Qed.
Example test_oddb2: (oddb (S (S (S (S O ))))) = false.
Proof. simpl. reflexivity. Qed.

Module Playground2.

Fixpoint plus (n : nat) (m : nat) : nat :=
  match n with
    | O => m
    | S n' => S (plus n' m)
  end.

Fixpoint mult (n m : nat) : nat :=
  match n with
    | O => O
    | S n' => plus m (mult n' m)
  end.

Fixpoint minus (n m: nat) : nat :=
  match n, m with
  | O , _  => O
  | S _ , O => n
  | S n' , S m' => minus n' m'
  end.


End Playground2.

Fixpoint exp(base power : nat) : nat :=
  match power with
  | O => S O
  | S p => mult base (exp base p)
  end.

Example test_mult1: (mult 3 3 ) = 9.
Proof. simpl. reflexivity. Qed.

Fixpoint factorial( n: nat) : nat :=
  match n with
  | O => 1
  | S n => mult (S n)  (factorial n)           
  end.
Fixpoint sum ( n : nat) : nat :=
  match n with
  | O => 0
  | S n => plus (S n) (sum n)
  end.

Example test_factorial1: (factorial 3) = 6.
Proof. simpl. reflexivity. Qed.
Example test_factorial2: (factorial 5) = (mult 10 12).
Proof. simpl. reflexivity. Qed.

Example test_sum1: (sum 3) = 6.
Proof. simpl. reflexivity. Qed.
Example test_sum2: (sum 10) = 55.
Proof. simpl. reflexivity. Qed.

Notation "x + y" := (plus x y) (at level 50, left associativity) : nat_scope.
Notation "x - y" := (minus x y) (at level 50,left associativity) : nat_scope.
Notation "x * y" := (mult x y) (at level 40, left associativity) : nat_scope.

Check (( 0 + 1 ) + 1).
(* Haskell への エクスポート *)
Require Extraction.
Extraction Language Haskell.
Extraction "../extraction/Haskell/value.hs" bool negb orb andb nandb andb3.
(**************************)

(* Ocaml への エクスポート *)
Require Extraction.
Extraction Language OCaml.
Extraction "../extraction/Ocaml/value.ml" bool negb orb andb nandb andb3.
(**************************)

(* JSON への エクスポート *)ls
  
Require Extraction.
Extraction Language JSON.
Extraction "../extraction/JSON/value.json" bool negb orb andb nandb andb3.
(**************************)
