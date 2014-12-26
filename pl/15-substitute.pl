/* substitute(X, Y, Xs, Ys) - истина, если список Ys есть результат подстановки */
/* элемента Y на X в списке Xs. */

substitute(_, _, [], []).

substitute(X, Y, [X | Xs], [Y | Ys]) :-
    substitute(X, Y, Xs, Ys).

substitute(X, Y, [Z | Xs], [Z | Ys]) :-
    X \= Z, substitute(X, Y, Xs, Ys).
