concrete Twelf of LF = open Prelude in {
  lincat
    Sig, Binding, Decl, Defn, Id, Ids, Sdecl, Term = SS;

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
}
