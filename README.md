# Shelah's bound for the Hales–Jewett numbers

Lean 4 proof of the Hales–Jewett theorem with a bound at the fifth level of the Ackermann
function, following Shelah's argument in
[*Primitive recursive bounds for van der Waerden numbers*](https://doi.org/10.1090/S0894-0347-1988-0929498-X),
Journal of the American Mathematical Society 1 (1988), 683–697.

## Results

For $k \ge 1$ letters, $r$ colors and $n \ge A_5(2k + r)$, every coloring with $r$ colors of the
words of length $n$ over $k$ letters has a monochromatic combinatorial line. Here $A_m(n)$ is
Mathlib's Ackermann function `ack m n`: `ack 3` is exponential, `ack 4` is a tower of
exponentials and `ack 5` iterates `ack 4`.

[Challenge.lean](Challenge.lean) contains this statement with a `sorry` placeholder and no
definitions, and [Solution.lean](Solution.lean) proves it as
`Combinatorics.Line.exists_mono_of_ack_le'`: if `0 < k` and `ack 5 (2 * k + r) ≤ n`, every
coloring `C : (Fin n → Fin k) → Fin r` has a monochromatic line.

The library proves the same for finite types as `Combinatorics.Line.exists_mono_of_ack_le`: every
coloring `C : (ι → α) → κ` has a monochromatic line when `α` is nonempty and
`ack 5 (2 * card α + card κ) ≤ card ι`.

## Files

| Files in `ShelahHalesJewett/` | Contents |
| --- | --- |
| `Line.lean` | Reindexing a line, the subspace spanned by a subspace and a line, a line of a subspace, and the pigeonhole step |
| `HalesJewett.lean` | The insensitive subspace and the Hales–Jewett theorem in a dimension given by a recursion |
| `Ackermann.lean` | This dimension is less than `ack 5 (2 * k + r)`, and the Hales–Jewett theorem with this bound |

The proof is by induction on the alphabet, as Mathlib's proof of the Hales–Jewett theorem,
`Combinatorics.Line.exists_mono_in_high_dimension`. To add a letter, it finds a subspace on which
the color of a word does not change when the new letter is replaced by a fixed old one. A
monochromatic line over the old alphabet in the parameter cube of this subspace is then
monochromatic at the new letter as well. This gives a recursion for the dimension, and
`Ackermann.lean` proves that it is less than `ack 5 (2 * k + r)`.

## Build

The Lean and Mathlib versions are pinned in `lean-toolchain`, `lakefile.toml` and
`lake-manifest.json`.

```sh
lake exe cache get
lake build
```

The default build includes the library, challenge, and solution. The `sorry` warning from
`Challenge.lean` is expected.
