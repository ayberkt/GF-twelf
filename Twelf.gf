concrete Twelf of LF = open Formal, Prelude in {
  flags
    lexer = lexcode;
    unlexer = unlexcode;

  lincat
    Sig, Binding, Decl, Defn, Id, Ids, Sdecl, Term, Typ = Formal.TermPrec;
    ConDec, Program = SS;

  lin
    id x = constant x.s;

    conDec x tm = ss (period (ascribe x.s tm.s));

    larrow = infixr 0 "->";
    rarrow = infixl 0 "<-";

    -- Linearization for pgm.
    emptyPgm = ss "";
    consPgm d p = ss (d.s ++ p.s);

  oper
    braces : Str -> Str = \s -> "{" ++ s ++ "}";

    brackets : Str -> Str = \s -> "[" ++ s ++ "]";

    ascribe : Str -> Str -> Str = \s1 -> \s2 -> s1 ++ ":" ++ s2;

    period : Str -> Str = \s -> s ++ ".";
}
