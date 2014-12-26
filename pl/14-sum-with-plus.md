# Задание

`sum/2` c использованием `plus/3`

## Решение

**sum(Xs, X)** - истина, если X равен сумме элементов списка Xs

**Xs** - список, каждый элемент которого имеет тип natural_number

**X** - натуральное число `n`, представленное  в виде `s^n(0)`.

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

## Тесты

### sum(+, +)

    ?- sum([s(0)], s(0)).
    true.

    ?- sum([s(0), s(s(0))], s(s(s(0)))).
    true.

    ?- sum([s(0), s(s(0))], s(s(0))).
    false.

### sum(+, -)

    ?- sum([], X).
    X = 0.

    ?- sum([s(0)], X).
    X = s(0).

    ?- sum([s(s(0))], X).
    X = s(s(0)).

    ?- sum([s(s(0)), s(0)], X).
    X = s(s(s(0))).

    ?- sum([s(s(0)), s(s(0)), s(0)], X).
    X = s(s(s(s(s(0))))).

### sum(-, +)

    ?- sum(X, s(s(s(s(0))))).
    X = [s(s(s(s(0))))];
    X = [s(s(s(s(0)))), 0];
    X = [s(s(s(0))), s(0)];
