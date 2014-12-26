# Задание

`gcd` (greatest common divisor) без `mod`

## Решение

*pseudo code:*

    function gcd(a, b)
       while a != b
            if a > b
                a := a - b
            else
               b := b - a
        return a

*prolog:*

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

## Тесты

### gcd(+, +, +)

    ?- gcd(s(s(0)), s(0), s(0)).
    true

    ?- gcd(s(s(s(0))), s(s(s(0))), s(s(s(0)))).
    true

    ?- gcd(s(0), s(s(0)), s(s(0))).
    false

### gcd(+, +, -)

    ?- gcd(s(s(0)), s(0), X).
    X = s(0)

    ?- gcd(s(s(s(0))), s(s(s(0))), X).
    X =  s(s(s(0)))

    ?- gcd(s(0), s(s(0)), X).
    X = s(0)