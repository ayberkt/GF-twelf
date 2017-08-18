concrete LFLaTeX of LF = open Formal, Prelude, (L = Latex) in {
  flags
    lexer = lexcode;
    unlexer = unlexcode;

  lincat
    Sig, Binding, Decl, Defn, Id, Ids, Sdecl, Typ = SS;
    Term = {s : Str; isAtomic : Bool};
    Program = SS;
    ConDec = SS;

  lin
    id x = {s = x.s; isAtomic = True};

    larrow tm1 tm2 =
      case tm2.isAtomic of {
        True  => {s = showTerm tm1 tm2; isAtomic = False};
        False => {s = showTerm tm1 tm2; isAtomic = False}
      };

    conDec tm tms =
      let
        content : Str =
          case tms.isAtomic of {
            True => (L.command "infer") ++ showAxiom tm.s tms.s;
            False => "TODO"
          }
      in
        ss (L.inEnv "proof" content);

    emptyPgm = ss "";
    consPgm d p = ss (d.s ++ "\n" ++ p.s);

  param
    Inference = Axiom | Premises;

  oper
    showAxiom : Str -> Str -> Str =
      \s1 -> \s2 -> "{" ++ s1 ++ ":" ++ s2 ++ "}" ++ "{" ++ "}";

    showTerm : Term -> Term -> Str =
      \tm1 -> \tm2 ->
        "{" ++ tm1.s ++ "}" ++ "{" ++ "}";
}
