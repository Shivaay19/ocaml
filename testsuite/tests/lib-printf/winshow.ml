(* TEST
 arch64;
 windows;
 bytecode;
 native;
*)

(* Throwaway: show what mingw-w64 actually returns for pr15272's inputs. *)

let show f =
  match f () with
  | s when String.length s <= 40 ->
      Printf.printf "ok, %S\n" s
  | s -> Printf.printf "ok, length %d\n" (String.length s)
  | exception e -> print_endline (Printexc.to_string e)

let () =
  show (fun () -> Printf.sprintf "%.*f" max_int 1.0);
  show (fun () -> Printf.sprintf "%20.*f" max_int 1.0)
