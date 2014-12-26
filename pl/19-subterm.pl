/* subtetm(T1, T2) - истина, если T1 является частью T2 */

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
    
    