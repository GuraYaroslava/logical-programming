/* even и odd для представления натурального числа n  виде s^n(0) */

natural_number(0).
natural_number(s(X)) :- natural_number(X).

even(0).
odd(s(0)).

even(s(X)) :-
    natural_number(X),
    odd(X).

odd(s(X)) :-
    natural_number(X),
    even(X).
    
/*
even(0).
odd(s(0)).
odd(s(s(X))) :- natural_number(X), even(X).
even(s(s(X))) :- natural_number(X), odd(X).
*/
    
/*
even(0).
odd(X) :- X1 is X-1, even(X).
even(X) :- X1 is X-1, odd(X).
*/
