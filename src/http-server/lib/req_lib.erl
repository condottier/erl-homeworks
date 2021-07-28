-module(req_lib).
-export([parse_headers/1]).

parse_headers(Headers)->
    Chunks = string:split(Headers , <<"\r\n">>, all),
    io:format("~p~n", [Chunks]).
