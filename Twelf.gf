concrete Twelf of LF = open Formal, Prelude in {
  flags
    lexer = lexcode;
    unlexer = unlexcode;

  lincat
    Typ = SS;
    ConDec, Program = SS;
    Term = Formal.TermPrec;

  lin
    id x = constant x.s;

    conDec x tm = ss (period (ascribe x.s tm.s));

    larrow = infixr 1 "->";
    rarrow = infixr 1 "<-";

    -- Term application.
    app tm1 tm2 =  constant (paren (tm1.s ++ tm2.s));

    -- Linearization for pgm.
    emptyPgm = ss "";
    consPgm d p = ss (d.s ++ p.s);

  oper
    braces : Str -> Str = \s -> "{" ++ s ++ "}";

    brackets : Str -> Str = \s -> "[" ++ s ++ "]";

    ascribe : Str -> Str -> Str = \s1 -> \s2 -> s1 ++ ":" ++ s2;

    period : Str -> Str = \s -> s ++ ".";
}
