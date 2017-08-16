concrete Twelf of LF = open Prelude in {
  lincat
    Sig = SS;

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
}
