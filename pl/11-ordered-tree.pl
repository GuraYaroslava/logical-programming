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
