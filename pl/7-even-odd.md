# Задание 

`even` и `odd` для представления натурального числа `n`  виде `s^n(0)`

## Решение

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

## Тесты

### even

    ?- even(0).
    true.

    ?- even(s(0)).
    false.

    ?- even(s(s(0))).
    true.

    ?- even(X).
    X = 0;
    X = s(s(0));
    X = s(s(s(s(0))));
    X = s(s(s(s(s(s(0))))));

### odd

    ?- odd(0).
    true.

    ?- odd(s(0)).
    false.

    ?- odd(s(s(0))).
    true.

    ?- odd(X).
    X = s(0);
    X = s(s(s(0)));
    X = s(s(s(s(s(0))))).
