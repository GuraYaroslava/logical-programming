# Задание

Отношение для упорядоченного дерева.

## Решение

Бинарное дерево является упорядоченным, если для каждого узла верно,
что значение в нём больше любого значения в узглах из левого поддерева
и больше либо равно любому значению из правого поддерева.

- **ordered\_tree**/1 проверяет, является ли дерево
    упорядоченным, успользуя предикат **check\_ordering**/3. 

        ordered_tree(X) - истина, если X - упорядоченное бинарное дерево
        X - узел дерева, допустимые значения: элемент типа node, либо null

- **check\_ordering**/3 проверяет, выполняется ли условие упорядоченности для
        текущего узла и его правого и левого поддерева.

        check_ordering(Data, Left, Right)
        Data - число
        Left - узел дерева
        Right - узел дерева

- **is\_data**/1 

        is_data(X)
        X - число

- **less\_eq\_or\_null**/2 - проверка на =< 
        с учетом того, что вторым аргументом может быть null)

        check_less_eq_or_null(Data1, Data2) 
        Data1 - число или null
        Data2 - число или null

- **greate\r_or\_null**/2 - проверка на > 
        с учетом того, что вторым аргументом может быть null

        check_greater_or_null(Data1, Data2)
        Data1 - число или null
        Data2 - число или null

### Исходный код

    ordered_tree(null).
    ordered_tree(node(Data, Left, Right)) :-
        number(Data),
        check_ordering(Data, Left, Right),
        ordered_tree(Left),
        ordered_tree(Right).

    check_ordering(Data, Left, Right) :-
        less_eq_or_null(Data, Right),
        greater_or_null(Data, Left).

    less_eq_or_null(Data, null) :- number(Data).
    less_eq_or_null(Data, node(DataNode, _, _)) :-
        number(Data),
        =<(Data, DataNode).

    greater_or_null(Data, null) :- number(Data).
    greater_or_null(Data, node(DataNode, _, _)) :-
        number(Data),
        >(Data, DataNode).

### Тесты

#### ordered\_tree(+)

    ?- ordered_tree(node(10, null, null)).
    true.

    ?- ordered_tree(null).
    true.

    ?- ordered_tree(node(10, node(5, null, null), node(15, null, null))).
    true.

    ?- ordered_tree(node(10, node(5, node(0, null, null), null), node(15, null, node(20, null, null)))).
    true.

    ?- ordered_tree(node(10, node(100, node(0, null, null), node(10, null, null)), null).
    false.

#### ordered\_tree(-)

    ?- ordered_tree(X).
    X = null;
    false.
