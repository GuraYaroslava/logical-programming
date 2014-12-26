# Задание

Написать программу для отношения `substitute/4` для списков:
меняет в заданном списке LX некоторый элемент X на Y,
в результате получается список LY.

## Решение

    substitute(_, _, [], []).

    substitute(X, Y, [X | Xs], [Y | Ys]) :-
        substitute(X, Y, Xs, Ys).

    substitute(X, Y, [Z | Xs], [Z | Ys]) :-
        X \= Z, substitute(X, Y, Xs, Ys).


## Тесты

### substitute(+, +, +, +)

    ?- substitute(a, a, [a], [a]).
    true.

    ?- substitute(a, b, [a], [b]).
    true.

    ?- substitute(a, b, [a, b, b, a, a, b, a], [b, b, b, b, b, b, b]).
    true.

    ?- substitute(a, a, [a], [a, a, a]).
    false.

    ?- substitute(a, b, [a, b, b, a, a, b, a], [a, a, a, a, a, a, a]).
    false.

### substitute(+, +, +, -)

    ?- substitute(a, a, [a], X).
    X = [a];
    false.

    ?- substitute(a, b, [a], X).
    X = [b];
    false.

    ?- substitute(a, b, [a, b, b, a, a, b, a], X).
    X = [b, b, b, b, b, b, b];
    false.

### substitute(+, +, -, -)

    ?- substitute(a, a, X, X).
    X = [];
    X = [a];
    X = [a, a];
    X = [a, a, a];
    X = [a, a, a, a];
    X = [a, a, a, a, a].

    ?- substitute(a, b, X, Y).
    X = Y, Y = [];
    X = [a], Y = [b];
    X = [a, a], Y = [b, b];
    X = [a, a, a], Y = [b, b, b];
    X = [a, a, a, a], Y = [b, b, b, b].

### substitute(+, -, -, -)

    ?- substitute(a, X, Y, Z).
    Y = Z, Z = [];
    Y = [a], Z = [X];
    Y = [a, a], Z = [X, X];
    Y = [a, a, a], Z = [X, X, X] ;
    Y = [a, a, a, a], Z = [X, X, X, X].

    ?- substitute(a, X, X, X).
    X = [];
    false.

    ?- substitute(a, X, Y, Y).
    Y = [];
    X = a, Y = [a];
    X = a, Y = [a, a];
    X = a, Y = [a, a, a];
    X = a, Y = [a, a, a, a].

### substitute(-, -, -, -)

    ?- substitute(A, B, C, D).
    C = D, D = [];
    C = [A], D = [B];
    C = [A, A], D = [B, B];
    C = [A, A, A], D = [B, B, B].

    ?- substitute(A, A, C, D).
    C = D, D = [];
    C = D, D = [A];
    C = D, D = [A, A];
    C = D, D = [A, A, A].

### substitute(-, +, +, +)

    ?- substitute(X, b, [a], [a]).
    false.

    ?- substitute(X, b, [a], [b]).
    X = a;
    false.

### substitute(-, -, +, +)

    ?- substitute(X, Y, [a], [a]).
    X = Y, Y = a;
    false.

    ?- substitute(X, Y, [a], [b]).
    X = a, Y = b;
    false.

### substitute(-, -, -, +)

    ?- substitute(X, Y, Z, [b]).
    Y = b, Z = [X];
    false.

### substitute(+, -, +, -)

    ?- substitute(a, X, [a], Y).
    Y = [X];
    false.

    ?- substitute(a, X, [b], Y).
    Y = [b];
    false.

### substitute(-, +, -, +)

    ?- substitute(X, a, Y, [b]).
    false.

    ?- substitute(X, a, Y, [a]).
    Y = [X];
    false.