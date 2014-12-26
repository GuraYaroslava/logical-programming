/* sum/2 с использованием plus/3 */

natural_number(0).
natural_number(s(X)) :- natural_number(X).

plus(A, 0, A) :- natural_number(A).

plus(A, s(B), s(C)) :-
    natural_number(A),
    natural_number(B),
    plus(A, B, C).
        
sum([], 0).
sum([X | Xs], Y) :-
    sum(Xs, Z),
    plus(X, Z, Y).
