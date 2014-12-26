/* substitute(X, Y, Xs, Ys) - ������, ���� ������ Ys ���� ��������� ����������� */
/* �������� Y �� X � ������ Xs. */

substitute(_, _, [], []).

substitute(X, Y, [X | Xs], [Y | Ys]) :-
    substitute(X, Y, Xs, Ys).

substitute(X, Y, [Z | Xs], [Z | Ys]) :-
    X \= Z, substitute(X, Y, Xs, Ys).
