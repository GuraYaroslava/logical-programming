/* gcd (greatest common divisor) без mod */

natural_number(0).
natural_number(s(X)) :- natural_number(X).

plus(0, X, X) :- natural_number(X).
plus(s(X), Y, s(Z)) :- plus(X, Y, Z).

greater(X, 0) :- natural_number(X).
greater(s(X), s(Y)) :- greater(X, Y).

gcd(0, X, X) :- natural_number(X).
gcd(X, 0, X) :- natural_number(X).
gcd(X, Y, Z) :- greater(X, Y), plus(Y, Z, X), gcd(Z, Y, G).
gcd(X, Y, Z) :- greater(Y, X), plus(X, Z, Y), gcd(X, Z, G).