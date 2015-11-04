open Core.Std
open Printf

let psafe3_dump file () =
  let bits = Bitstring.bitstring_of_file file in
  bitmatch bits with
  | { "PWS3" : 32 : string;
      salt : 256 : bitstring;
      iter : 32 : littleendian;
      stretched_key : 256 : bitstring;
      stretched_key_hash : 256 : bitstring;
      b1 : 128 : bitstring;
      b2 : 128 : bitstring;
      b3 : 128 : bitstring;
      b4 : 128 : bitstring;
      iv : 128 : bitstring;
      _ : -1 : bitstring
    } ->
    printf "PSAFE3 FILE\n";
    printf "ITER = %ld\n" iter;
    printf "SALT\n";
    Bitstring.hexdump_bitstring stdout salt;
    printf "P'\n";
    Bitstring.hexdump_bitstring stdout stretched_key;
    printf "H(P')\n";
    Bitstring.hexdump_bitstring stdout stretched_key_hash;
    printf "B1\n";
    Bitstring.hexdump_bitstring stdout b1;
    printf "B2\n";
    Bitstring.hexdump_bitstring stdout b2;
    printf "B3\n";
    Bitstring.hexdump_bitstring stdout b3;
    printf "B4\n";
    Bitstring.hexdump_bitstring stdout b4;
    printf "IV\n";
    Bitstring.hexdump_bitstring stdout iv
  | { _ } ->
    failwith "Not a psafe3 file."

let command =
  Command.basic
    ~summary:"Dump psafe3 file prologue."
    ~readme:(fun () -> "Does not decrypt the file.")
    Command.Spec.(empty +> anon ("filename" %: string))
    psafe3_dump

let () =
  Command.run ~version:"0.1" ~build_info:"mockbutler@gmail.com" command
