/-
Copyright (c) 2026 Gabriel Dahia. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Gabriel Dahia
-/
module

public import Mathlib.Combinatorics.HalesJewett
public import Mathlib.Computability.Ackermann

/-!
# A bound for the Hales--Jewett numbers at the fifth level of the Ackermann function

Shelah's theorem: the Hales--Jewett number of `k` letters and `r` colors is at most
`ack 5 (2 * k + r)`. The proof is in `Solution.lean`.
-/

@[expose] public section

namespace Combinatorics.Line

/-- **Shelah's theorem.** For `k ≥ 1` letters, `r` colors and `n ≥ ack 5 (2 * k + r)`, every
coloring of the words of length `n` has a monochromatic combinatorial line. -/
theorem exists_mono_of_ack_le' {k r n : ℕ} (hk : 0 < k) (hn : ack 5 (2 * k + r) ≤ n)
    (C : (Fin n → Fin k) → Fin r) : ∃ l : Line (Fin k) (Fin n), l.IsMono C :=
  sorry

end Combinatorics.Line
