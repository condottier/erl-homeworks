%%%-------------------------------------------------------------------
%% @doc erl_homework public API
%% @end
%%%-------------------------------------------------------------------

-module(erl_homework_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    srv:start(),
    erl_homework_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
