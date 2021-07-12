-module(palindrom).
-export([check/1, checkTR/1]).


check([]) ->
    true;
check([_]) ->
    true;
check([A, A]) ->
    true;
check([_A, _B]) ->
    false;
check([First | Tail]) ->
    {Mid, Last} = pop(Tail),
    check(Mid) and check([First, Last]).

pop([A, B]) ->
    {[A], B};
pop([First | Tail]) ->
    {Middle, Last} = pop(Tail),
    {[First | Middle], Last}.

%% === TAIL RECURSION ? ===
checkTR(List) ->
	checkTR(List, true).

checkTR(_, false) ->
    false;
checkTR([], _) -> true;
checkTR([_], _) -> true;
checkTR([A, A], _) -> true;
checkTR([_A, _B], _) -> false;
checkTR([First | Tail], true) ->
    {Mid, Last} = pop(Tail),
    io:format("iteration ~w ~w ~n", [First, Last]),
    checkTR(Mid, checkTR([First, Last], empty)).
