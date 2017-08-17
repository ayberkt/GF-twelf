concrete Twelf of LF = open Prelude in {
  flags
    lexer = lexcode;
    unlexer = unlexcode;

  lincat
    Sig, Binding, Decl, Defn, Id, Ids, Sdecl, Term, Typ, ConDec, Program = SS;

  lin
    id x = ss x.s;

    conDec x tm = ss (period (ascribe x.s tm.s));

    -- Linearization for pgm.
    singletonPgm d = ss d.s;
    consPgm d p = ss (d.s ++ p.s);

  oper
    braces : Str -> Str = \s -> "{" ++ s ++ "}";

    brackets : Str -> Str = \s -> "[" ++ s ++ "]";

    ascribe : Str -> Str -> Str = \s1 -> \s2 -> s1 ++ ":" ++ s2;

    period : Str -> Str = \s -> s ++ ".";
}
