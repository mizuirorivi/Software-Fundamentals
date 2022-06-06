module Value where

import qualified Prelude

__ :: any
__ = Prelude.error "Logical or arity value used"

data Bool =
   True
 | False

data Nat =
   O
 | S Nat

add :: Nat -> Nat -> Nat
add n m =
  case n of {
   O -> m;
   S p -> S (add p m)}

mul :: Nat -> Nat -> Nat
mul n m =
  case n of {
   O -> O;
   S p -> add m (mul p m)}

sub :: Nat -> Nat -> Nat
sub n m =
  case n of {
   O -> n;
   S k -> case m of {
           O -> n;
           S l -> sub k l}}

plus_O_n :: ()
plus_O_n =
  __

plus :: Nat -> Nat -> Nat
plus n m =
  case n of {
   O -> m;
   S n' -> S (plus n' m)}

mult :: Nat -> Nat -> Nat
mult n m =
  case n of {
   O -> O;
   S n' -> plus m (mult n' m)}

minus :: Nat -> Nat -> Nat
minus n m =
  case n of {
   O -> O;
   S n' -> case m of {
            O -> n;
            S m' -> minus n' m'}}

beq_nat :: Nat -> Nat -> Bool
beq_nat n m =
  case n of {
   O -> case m of {
         O -> True;
         S _ -> False};
   S n' -> case m of {
            O -> False;
            S m' -> beq_nat n' m'}}

