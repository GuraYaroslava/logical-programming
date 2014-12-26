/* sum/2 без использования plus/3 */

natural_number(0).
natural_number(s(X)) :- natural_number(X).

sum([], 0).
sum([s(X) | Xs], s(Y)) :- sum([X | Xs], Y).
sum([0 | Xs], Y) :- sum(Xs, Y).
