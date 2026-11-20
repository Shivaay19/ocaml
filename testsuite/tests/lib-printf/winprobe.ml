(* TEST
 modules = "winprobe_stubs.c";
 arch64;
 bytecode;
 native;
*)

(* Temporary probe for #15272 on Windows CI; not part of the PR. *)

external crt : unit -> string = "winprobe_crt"
external format_float : string -> float -> string = "caml_format_float"
external format_int : string -> int -> string = "caml_format_int"

let show name f =
  match f () with
  | s ->
      Printf.printf "%s: ok, length %d, tag %d\n%!"
        name (String.length s) (Obj.tag (Obj.repr s))
  | exception e -> Printf.printf "%s: %s\n%!" name (Printexc.to_string e)

let () =
  Printf.printf "crt: %s\n%!" (crt ());
  show "format_float precision (floats.c)"
    (fun () -> format_float "%.4611686018427387903f" 1.0);
  show "format_int precision (str.c)"
    (fun () -> format_int "%.4611686018427387903d" 1);
  show "format_int width (str.c)"
    (fun () -> format_int "%4611686018427387903d" 1);
  show "control" (fun () -> format_float "%.200f" 1.0)
