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

    conDec tm tms =
      let
        content : Str =
          case tms.isAtomic of {
            True =>
              (L.command "gfInfer") ++ showAxiom tm.s tms.s;
            False =>
              (L.command "gfInfer") ++ "[" ++ tm.s ++ "]" ++ showTerm tms
          }
      in
        ss (L.inEnv "proof" content);

    emptyPgm = ss "";
    consPgm d p = ss (d.s ++ "\n" ++ p.s);

  param
    Inference = Axiom | Premises;

  oper
    showAxiom : Str -> Str -> Str =
      \s1 -> \s2 -> "{" ++ s1 ++ "}";

    showTerm : Term -> Str =
      \tm2 -> "{" ++ tm2.s;
}
