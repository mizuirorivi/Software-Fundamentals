Inductive bool : Type :=
  | true : bool
  | false : bool.

Definition negb (b:bool) : bool :=
  match b with
  | true => false
  | false => true
  end.

Definition andb (b1:bool) (b2:bool) : bool :=
  match b1 with
  | true => b2
  | false => false
  end.

Definition orb (b1:bool) (b2:bool) : bool :=
  match b1 with
  | true => true
  | false => b2
  end.

(* orbのテスト *)
Example test_orb1: (orb true false) = true.
Proof. simpl. reflexivity. Qed.
Example test_orb2: (orb false false) = false.
Proof. simpl. reflexivity. Qed.
Example test_orb3: (orb false true ) = true.
Proof. simpl. reflexivity. Qed.
Example test_orb4: (orb true true ) = true.
Proof. simpl. reflexivity. Qed.

Definition admit {T: Type} : T. Admitted.

Definition nandb (b1: bool) (b2: bool) : bool :=
  match (andb b1 b2) with
  | true => false
  | false => true
  end.

(* nandのテスト *)
Example test_nandb1: (nandb false false) = true.
Proof. simpl. reflexivity. Qed.
Example test_nandb2: (nandb false true) = true.
Proof. simpl. reflexivity. Qed.
Example test_nandb3: (nandb true false) = true.
Proof. simpl. reflexivity. Qed.
Example test_nandb4: (nandb true true) = false.
Proof. simpl. reflexivity. Qed.

Definition andb3 (b1:bool) (b2:bool) (b3:bool) : bool :=
  match (andb (andb b1 b2) (andb b2 b3)) with
  | true => true
  | false => false
end.

Example test_andb31: (andb3 true true true) = true.
Proof. simpl. reflexivity. Qed.
Example test_andb32: (andb3 false true true) = false.
Proof. simpl. reflexivity. Qed.
Example test_andb33: (andb3 true false true) = false.
Proof. simpl. reflexivity. Qed.
Example test_andb34: (andb3 true true false) = false.
Proof. simpl. reflexivity. Qed.
(* Haskell への エクスポート *)
Require Extraction.
Extraction Language Haskell.
Extraction "../extraction/Haskell/enum.hs" bool negb orb andb nandb andb3.
(**************************)

(* Ocaml への エクスポート *)
Require Extraction.
Extraction Language OCaml.
Extraction "../extraction/Ocaml/enum.ml" bool negb orb andb nandb andb3.
(**************************)

(* JSON への エクスポート *)ls
  
Require Extraction.
Extraction Language JSON.
Extraction "../extraction/JSON/enum.json" bool negb orb andb nandb andb3.
(**************************)
