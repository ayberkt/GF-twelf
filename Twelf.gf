concrete Twelf of LF = open Formal, Prelude in {
  flags
    lexer = lexcode;
    unlexer = unlexcode;

  lincat
    Term, Typ = SS;
    ConDec, Program = SS;
    [Typ] = SS;

  lin
    id x = constant x.s;

    conDec x tm = ss (period (ascribe x.s tm.s));

    lin BaseTyp t1 t2 = ss (t1.s ++ "->" ++ t2.s);
    lin ConsTyp t ts = ss (t.s ++ "->" ++ ts.s);

    -- Linearization for pgm.
    emptyPgm = ss "";
    consPgm d p = ss (d.s ++ p.s);

  oper
    braces : Str -> Str = \s -> "{" ++ s ++ "}";

    brackets : Str -> Str = \s -> "[" ++ s ++ "]";

    ascribe : Str -> Str -> Str = \s1 -> \s2 -> s1 ++ ":" ++ s2;

    period : Str -> Str = \s -> s ++ ".";
}
