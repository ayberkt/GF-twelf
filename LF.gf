abstract LF = open Prelude in {
  cat
    Sig; Decl; Defn; Sdecl; Id; Ids; Term; Typ; Binding;

  fun
    emptySig : Sig;
    constDecl : Decl -> Sig -> Sig;
    hasTyp : Id -> Term -> Decl;
    defn : Defn -> Decl;

    typedDecl : Id -> Term -> Term -> Defn;
    decl : Id -> Term -> Defn;

    anonTypedDefn : Term -> Term -> Defn;
    anonDefn : Term -> Defn;

    bind : Id -> Id -> Binding;
    typedBind : Id -> Id -> Term -> Binding;

    termBind : Binding -> Sdecl -> Sdecl;
    solveWithProof : Id -> Term -> Sdecl;
    solve : Term -> Sdecl;

    typ : Typ -> Term;
    varOrConst : Id -> Term;
    larrow : Term -> Term -> Term;
    rarrow : Term -> Term -> Term;
    pi : Id -> Term -> Term -> Term;
    lambda : Id -> Term -> Term -> Term;
    app : Term -> Term -> Term;
    ann : Term -> Term -> Term;
    hole : Term;
    piWithHole : Id -> Term -> Term;
    lambdaWithHole : Id -> Term -> Term;
}
