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
