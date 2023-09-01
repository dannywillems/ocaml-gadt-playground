# Play with GADT in OCaml

## Motivation

Over the years, I've seen a few patterns of GADT usecases. For instance,
a stack based and typed language like
[Michelson](https://tezos.gitlab.io/active/michelson.html). In particular, the
GADT offers the safety, at compile-time, that an instruction with two operands
won't be applied if the stack is empty or contains only one element.
It is a nice usecase of a GADT as it leverages runtime checks, and delegates the
work to the compiler. It enforces the user to have called specific instructions
to change the state (= the runtime value) of the type before applying a new
instructions. In a sense, it is useful to encode a typed computation.

Another pattern I encounter is the "finalization" pattern. A type `t` contains
some values, and only when the type `t` reaches a certain state (i.e. a
`finalized` state), the user can perform certain operations. For instance,
loading test parameters before running a test.
We also want to be able to call some functions on the type `t` independently of
its state, for instance to show the current state to log it.

## This work

This work contains a relatively simple interface to show how to avoid a runtime
check using a type-level construction when some data can be in different states.
An application can be a type whose runtime values must be in a certain state
before being used in some other functions.

See:
- [`gadt_playground.mli`](./lib/gadt_playground.mli) for a simple interface.
- [`gadt_playground.ml`](./lib/gadt_playground.ml) for an implementation.
- [`main.ml`](./bin/main.ml) for an example.

## Examples

```ocaml
(* This is a valid program *)
let () =
  let s = create () in
  let s = fill s [4] in
  let s = fill s [5] in
  let s = finalize s in
  show s
```

```ocaml
(* This is not a valid program,
   the finalize method has to be called before calling
   show *)
let () =
  let s = create () in
  let s = fill s [4] in
  let s = fill s [5] in
  show s
```

## Install & Test

```
opam switch create ./ 5.0.0
opam install dune
dune build
dune exec ./bin/main.exe
```

