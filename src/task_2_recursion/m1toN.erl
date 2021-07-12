-module(m1toN).

-export([print1toN/1, print1toNtail/1]).

print1toN(N) when N < 1 ->
    io:format("Invalid value~n");
print1toN(1) ->
    io:format("1 ");
print1toN(N) ->
    print1toN(N - 1),
    io:format("~w ", [N]).



%% === TAIL RECURSION ? ===
print1toNtail(N) when N < 1 ->
    io:format("Invalid value~n");
print1toNtail(N) ->
    print1toNtail(1, N).

print1toNtail(A, B) when A < B ->
    io:format("~w ", [A]),
    print1toNtail(A + 1, B);
print1toNtail(A, A) ->
    io:format("~w~n", [A]).
