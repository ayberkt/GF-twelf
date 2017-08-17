concrete Twelf of LF = open Prelude in {
  lincat
    Sig, Binding, Decl, Defn, Id, Ids, Sdecl, Term, Typ = SS;

  lin
    emptySig = ss "";
    constDecl d s = ss (d.s ++ s.s);

    hasTyp id tm = ss (id.s ++ ":" ++ tm.s);
    defn d = ss (d.s ++ BIND ++ ".");

    typedDecl id tm1 tm2 =
      ss (id.s ++ ":" ++ tm1.s ++ "=" ++ tm2.s);

    decl id tm = ss (id.s ++ "=" ++ tm.s);

    anonTypedDefn tm1 tm2 = ss ("_" ++ ":" ++ tm1.s ++ "=" ++ tm2.s);

    anonDefn tm = ss ("_" ++ "=" ++ tm.s);

    bind x y = ss (x.s ++ "=" ++ y.s);
    typedBind x y tm = ss (x.s ++ "=" ++ y.s ++ ":" ++ tm.s);

    termBind b sd = ss ("%define" ++ b.s ++ sd.s);

    solveWithProof x tm = ss ("%solve" ++ x.s ++ tm.s);

    solve tm = ss ("%solve" ++ "_" ++ ":" ++ tm.s);

    -- Linearizations for `term`.
    typ t = ss t.s;

    varOrConst x = ss x.s;

    larrow tm1 tm2 = ss (tm1.s ++ "->" ++ tm2.s);

    rarrow tm1 tm2 = ss (tm1.s ++ "<-" ++ tm2.s);

    pi x tm1 tm2 = ss (braces (x.s ++ ":" ++ tm1.s) ++ tm2.s);

    lambda x tm1 tm2 = ss (brackets (x.s ++ ":" ++ tm1.s) ++ tm2.s);

    app tm1 tm2 = ss (tm1.s ++ tm2.s);

    ann tm1 tm2 = ss (ascribe tm1.s tm2.s);

    hole = ss "_";

    piWithHole x tm = ss (braces x.s ++ tm.s);

    lambdaWithHole x tm = ss (brackets x.s ++ tm.s);
}
