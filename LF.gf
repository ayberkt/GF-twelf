abstract LF = open Prelude in {
  cat
    Sig; Decl; Defn; Sdecl; Id; Ids; Term; Typ; Binding; ConDec;

  fun
    -- Sort: sig
    emptySig : Sig;
    constDecl : Decl -> Sig -> Sig;

    -- Sort: decl
    hasTyp : Id -> Term -> Decl;
    defn : Defn -> Decl;
    typedDecl : Id -> Term -> Term -> Defn;
    decl : Id -> Term -> Defn;

    -- Sort: defn
    anonTypedDefn : Term -> Term -> Defn;
    anonDefn : Term -> Defn;

    bind : Id -> Id -> Binding;
    typedBind : Id -> Id -> Term -> Binding;

    -- Sort: sdecl
    termBind : Binding -> Sdecl -> Sdecl;
    solveWithProof : Id -> Term -> Sdecl;
    solve : Term -> Sdecl;

    -- Sort: ids
    idEmpty : Ids;
    idCons : Id -> Ids -> Ids;

    -- Sort: term
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

    -- Sort: condec
    conDec : Id -> Term -> ConDec;
}
