-module(fibonacci_tail).
-export([fib/1]).

fib( N ) -> helper(0, 1, N).


helper(Curr, _Prev, 0) -> Curr;
helper(Curr, Prev, Iter) -> helper(Curr + Prev, Curr, Iter -1 ).

% 0 0
% 1 1
% 2 1
% 3 2
% 4 3
% 5 5
% 6 8
% 7 13
% 8 21
% 9 34
%
