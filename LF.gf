abstract LF = open Prelude in {
  cat
    Term; ConDec; Program;
    Typ;
    [Typ]{2};

  fun
    -- Sort: id
    id : String -> Term;

    -- Constructor declaration
    conDec : Term -> Term -> ConDec;

    -- typ : Typ -> Term;
    larrow : Term -> Term -> Term;
    rarrow : Term -> Term -> Term;
    -- pi : Id -> Term -> Term -> Term;
    -- lambda : Id -> Term -> Term -> Term;
    -- app : Term -> Term -> Term;
    -- ann : Term -> Term -> Term;
    -- hole : Term;

    -- Sort: program
    emptyPgm : Program;
    consPgm : ConDec -> Program -> Program;
}
