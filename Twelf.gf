abstract Twelf = open Prelude in {
  cat
    Sig; Decl; Defn; Sdecl; Id; Ids; Term; Binding;

  fun
    emptySig : Sig;
    constDecl : Decl -> Sig -> Sig;
    hasTyp : Id -> Term -> Decl;
    defn : Defn -> Decl;

    typedDecl : Id -> Term -> Term -> Defn;
    decl : Id -> Term -> Defn;
    anonTypedDecl : Term -> Term -> Defn;
    anonDecl : Term -> Defn;

    bind : Id -> Id -> Binding;
    typedBind : Id -> Id -> Term -> Binding;

    termBind : Binding -> Sdecl -> Sdecl;
    solveWithProof : Id -> Term -> Sdecl;
    solve : Term -> Sdecl;
}
