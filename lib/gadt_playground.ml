type content = int list

type finalized = bool

type unfinalized = bool

type 'state t =
  | F : content -> finalized t
  | U : content -> unfinalized t

let create () =
  F []

let fill t ys = match t with
  | U xs -> U (List.append ys xs)
  (* Could be nice to refte this case *)
  | _ -> failwith "Unreachable"

let finalize t = match t with
  | U xs -> F xs
  | _ -> failwith "Unreachable"

let show t =
  match t with
  | F xs ->
    List.iter (fun x -> print_endline @@ string_of_int x) xs
  | _ -> failwith "Unreachable"
