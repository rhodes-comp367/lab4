module LogicSol where

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
identity x = x

-- p ∧ q implies q ∧ p.
and-comm : {P Q : Set} → P × Q → Q × P
and-comm (p , q) = q , p

-- p ∨ q implies q ∨ p.
or-comm : {P Q : Set} → P ⊔ Q → Q ⊔ P
or-comm (left p) = right p
or-comm (right q) = left q

-- false implies anything.
false-elim : {A : Set} → ⊥ → A
false-elim ()

-- false ∨ p implies p.
or-elim : {P : Set} → ⊥ ⊔ P → P
or-elim (right p) = p

-- p ∧ ~p is a contradiction.
and-cont : {P : Set} → ~ (P × ~ P)
and-cont (p , ~p) = ~p p

-- ## Theorems

thm1 : {P Q : Set} → (P → Q) → ~ (P × Q) → ~ P
thm1 x y p = y (p , x p)

thm2 : {P Q : Set} → P ⊔ Q → (P → ~ P) → Q
thm2 (left p) f = false-elim (f p p)
thm2 (right q) f = q

helper : {P : Set} → (P → ~ P) → ~ P
helper f p = f p p

thm3 : {P : Set} → ~ ((P → ~ P) × (~ P → P))
thm3 (f , g) = helper f (g (helper f))

