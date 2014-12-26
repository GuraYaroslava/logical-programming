# Задание

Объяснить порядок генерации подтермов по запросу `subterm(X, f(a, g(b))`

## Решение

### Программа
    subterm(T, T).

    subterm(S, T) :-
        compound(T),
        functor(T, F, N),
        subterm(N, S, T).

    subterm(I, S, T) :-
        I > 1,
        I1 is I-1,
        subterm(I1, S, T).

    subterm(I, S, T) :-
        arg(I, T, AI),
        subterm(S, AI).

### Тест

    ?- subterm(X, f(a, g(b))).
    X = f(a, g(b));
    X = a;
    X = g(b);
    X = b;
    false.

### Ответ

- `X = f(a, g(b));`

    По первому правилу: **subterm(T, T).**

- `X = a;`

    Сначала срабатывает отношение **subterm(S, T)**:
        subterm(X, f(a, g(b)))
    Для него проверяются правила:
    - **compound(T)**
            compound(f(a, g(b)))
        Вернет `true`, т.е. терм составной.
    - **functor(T, F, N)**
            functor(f(a, g(b)), F, N)
        Установит в *F* значение *f*, в *N* значение *2*.
        *F* - имя, *N* - арность терма
    - **subterm(N, S, T)**
            subterm(2, X, f(a, g(b)))
        Для этого правила срабатывает отношение **subterm(I, S, T)**
            subterm(I, S, T) :-
                I > 1,
                I1 is I-1,
                subterm(I1, S, T).
        для которого проверяются правила:
        - **I > 1**
                2 > 1
            Вернет `true`.
        - **I1 is I-1**
                I1 is 1
            В переменную *I1* установится значение *1*.
        - **subterm(I1, S, T)**
                subterm(1, X, f(a, g(b)))
            Снова переходим к отношению **subterm(N, S, T)**.
            В результате получим следующие результаты: 
                1 > 1
            получим `false`. Значит, отношение **subterm(N, S, T)**, определенное так
                subterm(I, S, T) :-
                    I > 1,
                    I1 is I-1,
                    subterm(I1, S, T).
            не подходит.
            Применяем отношение **subterm(N, S, T)**, определенное следующим образом
                subterm(I, S, T) :-
                    arg(I, T, AI),
                    subterm(S, AI).
            Тогда для `subterm(1, X, f(a, g(b)))`
                arg(1, f(a, g(b)), AI)
            установит в *AI* значение *a*. Здесь *AI* - i-ый аргумент *f*.
                subterm(X, a)
            Сработает отношение `subterm(T, T).`, и в `X` установится значение `a`.

- `X = g(b);`

    На этом этапе для второго аргумента `f(a, g(b))` применится отношение **subterm(N, S, T)**, определенное следующим образом
        subterm(I, S, T) :-
            arg(I, T, AI),
            subterm(S, AI).
    Получим:
        arg(2, f(a, g(b)), AI)
    В *AI* установится значение *g(b)*.
        subterm(X, g(b))
    Сработает отношение `subterm(T, T).`, и в `X` установится значение `g(b)`.

- `X = b;`

    На этом этапе для `g(b)` применится отношение **subterm(S, T)**, определенное следующим образом
        subterm(S, T) :-
            compound(T),
            functor(T, F, N),
            subterm(N, S, T).
    Рассуждая, как в первом случае с`X = a;`, придем к отношению `subterm(T, T).`,
    и в `X` установится значение `b`.