/* even_permutation(Xs, Ys) истина, если Ys - четная перестановка Xs. */
even_permutation(Xs, Ys) :-
    permute(Xs, Ys),
    sign_of_differences(Xs, 1, D),
    sign_of_differences(Ys, 1, E),
    D = E.

/* odd_permutation(Xs, Ys) истина, если Ys - нечетная перемтановка Xs. */
odd_permutation(Xs, Ys) :-
    permute(Xs, Ys),
    sign_of_differences(Xs, 1, D),
    sign_of_differences(Ys, 1, E),
    D =\= E.
  
/* permute(Xs, Ys) истина, если Ys это перестановка списка Xs. */
permute([], []).
permute([X|Xs], Ys1) :-
    pick(X, Ys1, Ys),
    permute(Xs, Ys).

/* pick(X, Ys, Zs) истина, если Zs - результат удаления из списка Ys */
/* одного вхождения элемента X */
pick(X, [X|Xs], Xs).
pick(X, [Y|Ys], [Y|Zs]) :- pick(X, Ys, Zs).

sign_of_differences([], D, D).
sign_of_differences([Y|Xs], D0, D) :-
    sign_of_differences_(Xs, Y, D0, D1),
    sign_of_differences(Xs, D1, D).

sign_of_differences_([], _, D, D).
sign_of_differences_([X|Xs], Y, D0, D) :-
    Y =\= X,
    D1 is D0 * (Y - X),
    sign_of_differences_(Xs, Y, D1, D).