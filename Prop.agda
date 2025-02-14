module Prop where

-- ## Types

data _×_ (A B : Set) : Set where
  _,_ : A → B → A × B

data _⊔_ (A B : Set) : Set where
  left : A → A ⊔ B
  right : B → A ⊔ B

data ⊥ : Set where

~ : Set → Set
~ A = A → ⊥

-- ## Rules

-- any proposition implies itself.
identity : {P : Set} → P → P
identity = ?

-- p ∧ q implies q ∧ p.
and-comm : {P Q : Set} → P × Q → Q × P
and-comm = ?

-- p ∨ q implies q ∨ p.
or-comm : {P Q : Set} → P ⊔ Q → Q ⊔ P
or-comm = ?

-- false implies anything.
false-elim : {A : Set} → ⊥ → A
false-elim = ?

-- false ∨ p implies p.
or-elim : {P : Set} → ⊥ ⊔ P → P
or-elim = ?

-- p ∧ ~p is a contradiction.
and-cont : {P : Set} → ~ (P × ~ P)
and-cont = ?

-- ## Theorems

thm1 : {P Q : Set} → (P → Q) → ~ (P × Q) → ~ P
thm1 = ?

thm2 : {P Q : Set} → P ⊔ Q → (P → ~ P) → Q
thm2 = ?

thm3 : {P : Set} → ~ ((P → ~ P) × (~ P → P))
thm3 = ?

