# Задание

`occurrences/3` - число вхождений подтерма в терм.

## Решение

Если 2 терма равны, то число вхождений равно 1. Если терм, в котором
происходит поиск составной, то следует рекурсивно пременить поиск
для всех его аргументов. В реализации введены 2 вспомогательных терма:
**compare\_terms\1** сравнивает 2 терма на равенство и возвращает 0 или 1.
**compare\_arguments\5** итеративно применяет проверку для каждого
аргумента составного терма.

**ocurences(Sub, Term, N)** - истина, если N - число вхождений
     терма Sub в терм Term
- Sub - произвольный тип
- Term - произвольный тип
- N - число

**compare\_terms(Term1, Term2, X)** - истина, если 2 терма равны и
    X = 1, либо не равны и X = 0
- Term1 - произвольный тип
- Term2 - произвольный тип
- X - число

**compare\_arguments(Sub, Term, ArgNum, CurrN, N)** - истина, если N -
     сумма числа вхождений терма Sub в первые ArgNum аргнументов терма
     Term и числа CurrN
- Sub - произвольный тип
- Term - произвольный тип
- ArgNum - число
- CurrN - число
- N - число

        occurences(Sub, Term, N) :-
            \+ compound(Term),
            compare_terms(Sub, Term, N).

        occurences(Sub, Term, N) :-
            compound(Term),
            functor(Term, _, ArgCnt),
            compare_terms(Sub, Term, X),
            compare_arguments(Sub, Term, ArgCnt, X, N).

        compare_terms(Term, Term, 1).

        compare_terms(Term1, Term2, 0) :-
            \+ compare(=, Term1, Term2).

        compare_arguments(_, _, ArgNum, CurrN, CurrN) :-
            =(ArgNum, 0).

        compare_arguments(Sub, Term, ArgNum, CurrN, N) :-
            >(ArgNum, 0),
            arg(ArgNum, Term, Arg),
            occurences(Sub, Arg, ArgN),
            NewN is ArgN + CurrN,
            NextArgNum is ArgNum - 1,
            compare_arguments(Sub, Term, NextArgNum, NewN, N).
