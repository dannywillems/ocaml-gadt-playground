(* Runtime content of the GADT. Not making abstract for the example *)
type content = int list

(* Abstract type to represent the finalized state of the computation *)
type finalized

(* Abstract type to represent the unfinalized state of the computation *)
type unfinalized

(* Computation *)
type _ t

(* Initialize a content *)
val create : unit -> unfinalized t

(* Fill the content of your value *)
val fill : unfinalized t -> content -> unfinalized t

(* Finalize the structure *)
val finalize : unfinalized t -> finalized t

(* Show the current state *)
val show_current_state : _ t -> unit

(* Methods to show the content *)
val show : finalized t -> unit
