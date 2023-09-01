open Gadt_playground

let () =
  let s = create () in
  let s = fill s [4] in
  let s = fill s [5] in
  let s = finalize s in
  show s
