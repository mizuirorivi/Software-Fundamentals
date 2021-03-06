From Coq Require Import Unicode.Utf8.
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

(* multのテスト *)
Example test_mult1: (mult 3 3 ) = 9.
Proof. simpl. reflexivity. Qed.

(* 階乗関数 *)
Fixpoint factorial( n: nat) : nat :=
  match n with
  | O => 1
  | S n => mult (S n)  (factorial n)           
  end.

(* sum関数
   例)
        sum 3 = 6
        sum 10 = 55
 *)
Fixpoint sum ( n : nat) : nat :=
  match n with
  | O => 0
  | S n => plus (S n) (sum n)
  end.

(* factorialのテスト *)
Example test_factorial1: (factorial 3) = 6.
Proof. simpl. reflexivity. Qed.
Example test_factorial2: (factorial 5) = (mult 10 12).
Proof. simpl. reflexivity. Qed.

(* sumのテスト *)
Example test_sum1: (sum 3) = 6.
Proof. simpl. reflexivity. Qed.
Example test_sum2: (sum 10) = 55.
Proof. simpl. reflexivity. Qed.

(* natでのoperatorの記述 *)
Notation "x + y" := (plus x y) (at level 50, left associativity) : nat_scope.
Notation "x - y" := (minus x y) (at level 50,left associativity) : nat_scope.
Notation "x * y" := (mult x y) (at level 40, left associativity) : nat_scope.

Check (( 0 + 1 ) + 1).

(* 自然数の比較 *)
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

(* 比較して小さいか等しい場合にtrueを返す関数 *)
Fixpoint ble_nat (n m: nat) : bool :=
  match n with
  | O => true
  | S n' =>
      match m with
      | O => false
      | S m' => ble_nat n' m'
      end
  end.

(* ble_natのテスト *)
Example test_ble_nat1: (ble_nat 2 2 ) = true.
Proof. simpl. reflexivity. Qed.
Example test_ble_nat2: (ble_nat 2 4) = true.
Proof. simpl. reflexivity. Qed.
Example test_ble_nat3: (ble_nat 4 2) = false.
Proof. simpl. reflexivity. Qed.

(* 比較して左側の値が小さいときにtrueを返す関数*)
Definition blt_nat(n m : nat) : bool :=
  match (beq_nat n m) with
  | true => false
  | false => (ble_nat n m)           
end.        

(* blt_natのテスト *)
Example test_blt_nat1: (blt_nat 2 2) = false.
Proof. compute. reflexivity. Qed.
Example test_blt_nat2: (blt_nat 2 4) = true.
Proof. compute. reflexivity. Qed.
Example test_blt_nat3: (blt_nat 4 2) = false.
Proof. compute. reflexivity. Qed.

Theorem plus_O_n : ∀ n:nat, 0 + n = n.

Proof.
  simpl. reflexivity. Qed.

(* Haskell への エクスポート *)
Require Extraction.
Extraction Language Haskell.
Extraction "../extraction/Haskell/value.hs" nat pred Playground1 minustwo evenb oddb Playground2 plus minus mult exp.
(**************************)

(* Ocaml への エクスポート *)
Require Extraction.
Extraction Language OCaml.
Extraction "../extraction/Ocaml/value.ml" ble_nat.
(**************************)

(* JSON への エクスポート *)
  
Require Extraction.
Extraction Language JSON.
Extraction "../extraction/JSON/value.json" ble_nat.
(**************************)
