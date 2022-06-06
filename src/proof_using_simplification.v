From Coq Require Import Unicode.Utf8.
Module Playground_rivi.
 (* 加法関数 *)
Fixpoint plus (n : nat) (m : nat) : nat :=
  match n with
    | O => m
    | S n' => S (plus n' m)
  end.
(* 乗算関数*)
Fixpoint mult (n m : nat) : nat :=
  match n with
    | O => O
    | S n' => plus m (mult n' m)
  end.
(* 減法関数 *)
Fixpoint minus (n m: nat) : nat :=
  match n, m with
  | O , _  => O
  | S _ , O => n
  | S n' , S m' => minus n' m'
  end.
(* natでのoperatorの記述 *)
Notation "x + y" := (Playground_rivi.plus x y) (at level 50, left associativity) : nat_scope.
Notation "x - y" := (Playground_rivi.minus x y) (at level 50,left associativity) : nat_scope.
Notation "x * y" := (Playground_rivi.mult x y) (at level 40, left associativity) : nat_scope.

(* operator "x+y"のテスト *)
Check (( 0 + 1 ) + 1).
(* 0が左単位元であることのテスト 式展開 *)
Theorem plus_O_n : ∀ n:nat, 0 + n = n.
Proof.
  simpl. reflexivity. Qed.
(* 0が左単位元であることのテスト 式展開なし *)
Theorem plus_O_n' : ∀ n:nat, 0 + n = n.
Proof.
  reflexivity. Qed.

(* simplでは右単位元は展開されないが、左単位元は展開される *)
Eval simpl in (∀ n: nat, n + 0 = n).
Eval simpl in (∀ n: nat, 0 + n = n).
(**************************************************)

(* ∀ n ∈ nat ,  1 + n = S n の定理 *)
Theorem plus_O_n'' : ∀ n: nat, 1 + n = S n.
(* 定理の証明 *)
Proof.
  intros n. reflexivity. Qed.
(* ∀ n ∈ nat,0が乗法の場合に左単位元であることの定理 *)
Theorem mult_0_l : ∀ n: nat, 0 * n = 0.
(* 証明 *)
Proof.
  intros n. reflexivity. Qed.
(* ∀ n, m ∈ nat, n = m の場合に n + n = m + mであることの定理 *)
Theorem plus_id_example : ∀ n m : nat,
    n = m ->
    n + n = m + m.
(* 証明 *)
Proof.
  intros n m. intros H. rewrite -> H. reflexivity. Qed.

(* n,m,o : nat でn = m,m=o の場合にn + m = m + oであることの定理 *)
Theorem plus_id_exercise : ∀ n m o : nat,
    n = m -> m = o  ->  n + m = m + o.
(* 上の定理の証明 *)
Proof.
  intros n m o.
  intros H1.
  intros H2.
  rewrite -> H1.
  rewrite -> H2.
  reflexivity.
Qed.

(* ∀ n m ∈ nat, (0 + n) * m = n * m の定理 *)
Theorem mult_0_plus : ∀ n m : nat,
    (0 + n ) * m = n * m.
(* 上の定理の証明 *)
Proof.
  intros n m.
  rewrite -> plus_O_n.
  reflexivity. Qed.

(* ∀ n m ∈ nat, (1 + n ) * m = m + (n * m)の定理 *)
Theorem  mult_1_plus : ∀ n m : nat,
    (1 + n ) * m = m + (n * m).
(* 上の定理の証明 *)
Proof.
  intros n m.
  reflexivity. Qed.
(* n == m => true, n!= m => falseの関数の定義 *)
Fixpoint beq_nat (n m : nat) : bool :=
  match n with
  | O => match m with
         | O => true
         | S m' => false
         end
  | S n' => match m with
            | O => false
            | S m' => beq_nat n' m'
            end
  end.


Theorem plus_1_neq_0_firsttry : ∀ n : nat,
    beq_nat ( n + 1 ) 0 = false.
Proof.
  intros n. simpl. Admitted.


Theorem plus_1_neq_0 : ∀ n : nat,
    beq_nat (n + 1) 0 = false.
Proof.
  (* nの変数名上書き,  n = 0,n != 0のゴールの場合分け *)
  intros n. destruct n as [| n'].
   (* n = 0,n != 0のゴールの場合分け *)
  reflexivity.
  reflexivity. Qed.

Theorem negb_involutive : ∀ b : bool,
    negb (negb b) = b.
Proof.
  intros b. destruct b.
   (* n = 0,n != 0のゴールの場合分け *)
  reflexivity.
  reflexivity. Qed.

Theorem zero_nbeq_plus_1 : ∀ n : nat,
    beq_nat 0 (n + 1) = false.
Proof.
  intros n. destruct n as [ | n'].
  (* n = 0,n != 0のゴールの場合分け *)
  reflexivity.
  reflexivity. Qed.

End Playground_rivi.


(* Haskell への エクスポート *)
Require Extraction.
Extraction Language Haskell.
Extraction "../extraction/Haskell/proof_using_simplification.hs" plus mult minus plus_O_n Playground_rivi.
(**************************)

(* Ocaml への エクスポート *)
Require Extraction.
Extraction Language OCaml.
Extraction "../extraction/Ocaml/proof_using_simplification.ml"  plus mult minus plus_O_n Playground_rivi.
(**************************)

(* JSON への エクスポート *)
  
Require Extraction.
Extraction Language JSON.
Extraction "../extraction/JSON/proof_using_simplification.json"  plus mult minus plus_O_n Playground_rivi.
(**************************)

