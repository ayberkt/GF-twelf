concrete LFLaTeX of LF = open Formal, Prelude, (L = Latex) in {
  flags
    lexer = lexcode;
    unlexer = unlexcode;

  lincat
    Typ, Program, ConDec = SS;
    Term = {s : Str; isAtomic : Bool};
    Program = SS;

  lin
    id x = {s = x.s; isAtomic = True};

    larrow tm1 tm2 =
      case tm2.isAtomic of {
        True  => {s = tm1.s ++ "}" ++ "{" ++ tm2.s ++ "}"; isAtomic = False};
        False => {s = tm1.s ++ "&" ++ tm2.s; isAtomic = False}
      };

    rarrow tm1 tm2 = {s = "TODO"; isAtomic = False};

    conDec tm1 tm2 =
      let
        cmd : Str = (L.command "gfInfer")
      in let
        content : Str =
          case tm2.isAtomic of {
            True =>
              cmd ++ showAxiom tm1.s tm2.s;
            False =>
              cmd ++ "[" ++ tm1.s ++ "]" ++ showTerm tm2
          }
      in
        ss (L.inEnv "proof" content);

    emptyPgm = ss "";
    consPgm d p = ss (d.s ++ "\n" ++ p.s);

  oper
    showAxiom : Str -> Str -> Str =
      \s1 -> \s2 -> "{" ++ s1 ++ "}";

    showTerm : Term -> Str =
      \tm2 -> "{" ++ tm2.s;
}
