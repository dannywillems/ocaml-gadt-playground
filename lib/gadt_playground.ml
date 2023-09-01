type content = int list

type finalized = bool

type unfinalized = bool

type 'state t =
  | F : content -> finalized t
  | U : content -> unfinalized t

let create () =
  U []

let fill t ys = match t with
  | U xs -> U (List.append ys xs)
  (* Could be nice to refte this case *)
  | _ -> assert false

let finalize t = match t with
  | U xs -> F xs
  | _ -> assert false

let show_current_state : type a. a t -> unit =
  fun t ->
  match t with
  | F xs | U xs ->
    List.iter (fun x -> print_endline @@ string_of_int x) xs

let show t =
  match t with
  | F xs ->
    List.iter (fun x -> print_endline @@ string_of_int x) xs
  | _ -> assert false
