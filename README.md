# psafe3info

Dead basic utility for dumping the file prologue of Password Safe
version 3 files. Really just an excuse to try out the Bitstring
module in [Ocaml][Ocaml].

## To Build

I have very superficial understanding of the Ocaml tooling,
so this is how I built it for testing. Cribbed from [Real World Ocaml][RWO].

    corebuild -pkg bitstring.syntax,bitstring psafe3info.native

[RWO]: https://realworldocaml.org/
[Ocaml]: http://ocaml.org/
