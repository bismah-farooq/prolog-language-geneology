% 43 date facts 
date(fortran1,1956).
date(lisp,1958).
date(algol60,1960).
date(cobol,1960).
date(pli,1964).
date(smalltalk,1968).
date(pascal,1970).
date(prolog,1970).
date(scheme,1974).
date(ml,1976).
date(fortran77,1976).
date(c,1978).
date(smalltalk80,1980).
date(ada83,1982).
date(commonlisp,1984).
date(sml,1984).
date(c,1984).
date(eiffel,1986).
date(perl,1986).
date(caml,1986).
date(tcl,1988).
date(python,1990).
date(fortran90,1990).
date(perl5,1994).
date(ruby,1994).
date(javascript,1994).
date(java,1994).
date(ocaml,1996).
date(cpp_iso,1998).
date(haskell98,1998).
date(scheme_r5rs,1998).
date(python2,2000).
date(csharp,2000).
date(java5,2004).
date(csharp2,2004).
date(go,2008).
date(kotlin,2010).
date(rust,2010).
date(haskell2010,2010).
date(csharp5,2012).
date(swift,2014).
date(java8,2014).
date(javascript_es2017,2016).                    


% 61 parent facts 
parent(fortran1,algol60). 
parent(fortran1,fortan77).
parent(fortran1,pli).
parent(algol60,tcl).
parent(algol60,cpp).
parent(algol60,c).
parent(algol60,smalltalk).
parent(algol60,perl).
parent(algol60,scheme).
parent(algol60,pli).
parent(cobol,pli).
parent(lisp,scheme).
parent(lisp,commonlisp). 
parent(pli,pascal).
parent(smalltalk,smalltalk80).
parent(pascal,python).
parent(pascal,ada83).
parent(scheme,scheme_r5rs).
parent(scheme,commonlisp).
parent(ml,haskel98).
parent(ml,sml).
parent(fortran77, fortran90).
parent(c,cpp).
parent(c,python).
parent(smalltalk80,ruby).
parent(smalltalk80,go).
parent(ada83,eiffel).
parent(cpp,rust).
parent(cpp,java).
parent(cpp,python).
parent(cpp,cpp_iso).
parent(sml,caml).
parent(perl,perl5).
parent(perl,ruby).
parent(eiffel,ruby).
parent(caml,ocaml).
parent(python,python2).
parent(python,ruby).
parent(java,java5).
parent(java,csharp).
parent(java,javascript).
parent(cpp_iso,csharp).
parent(javascript,kotlin).
parent(javascript,javascriptES2017).
parent(ruby,swift).
parent(ocaml,rust).
parent(cppiso,csharp).
parent(scheme_r5rs,rust).
parent(haskell98,rust).
parent(haskell98,haskell2010).
parent(csharp,csharp2).
parent(python2,go).
parent(python2,swift).
parent(java5,java8).
parent(java5,kotlin).
parent(csharp2,csharp5). 
parent(csharp2,kotlin).
parent(csharp2,rust).
parent(rust,swift).
parent(haskell2010,swift).
parent(csharp5,javascriptES2017).

% Rules 
predecessor(X, Y) :-
    parent(X, Y).

predecessor(X, Y) :-
    parent(X, Z),
    predecessor(Z, Y).

successor(X, Y) :-
    predecessor(Y, X).

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

cousin(X, Y) :-
    predecessor(P, X),
    predecessor(P, Y),
    \+ sibling(X, Y),
    X \= Y.

% Question 
% 1. Is Swift a successor of Lisp?
question1 :-
    ( successor(swift, lisp) -> writeln(true) ; writeln(false) ).

% 2. Are Smalltalk and C++ cousins?
question2 :-
    ( cousin(smalltalk, cpp) -> writeln(true) ; writeln(false) ).

% 3. Which languages are siblings of C++?
question3 :-
    findall(S, sibling(cpp, S), List),
    writeln(List).

% 4. Which languages were made in 1990?
question4 :-
    findall(L, date(L, 1990), List),
    writeln(List).

% 5. Which languages were created before 1980?
question5 :-
    findall(L, (date(L, Y), Y < 1980), List),

% 6. How many unique predecessors does Swift have?
question6 :-
    findall(P, predecessor(P, swift), L),
    list_to_set(L, S),
    length(S, N),
    writeln(N).

% 7. Which successors do C++ and ML have in common?
question7 :-
    findall(S1, successor(S1, cpp), A),
    findall(S2, successor(S2, ml), B),
    intersection(A, B, Result),
    list_to_set(Result, Final),
    writeln(Final).

% 8. Which languages have more than five predecessors?
question8 :-
    findall(L, (
        date(L,_),
        findall(P, predecessor(P, L), PList),
        list_to_set(PList, PSet),
        length(PSet, N),
        N > 5
    ), List),
    list_to_set(List, Final),
    writeln(Final).


