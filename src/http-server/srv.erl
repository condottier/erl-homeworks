-module(srv).
-export([start/0, handle/1]).

handle(Socket) ->
    Msg = gen_tcp:recv(Socket, 0),
    {ok, Content} = Msg,
    req_lib:parse_headers(Content),
    %io:format("~p~n~n",[Msg]),
    Html = <<"HTTP/1.1 200 OK\r\nContent-Length: 38\r\n\r\n<html><body>Hello Erlang</body></html>">>,
    gen_tcp:send(Socket, Html),    
    gen_tcp:close(Socket).

listen(ServerSocket) ->
    {ok, Socket} = gen_tcp:accept(ServerSocket),
%%    client(Socket),
%%    Info = timer:tc(test_tcp, client, [Socket]),
%%    io:format("~p~n",[Info]),
    spawn(srv, handle, [Socket]),
    listen(ServerSocket).

start() ->
    io:format("Server started"),
    {ok, ServerSocket} = gen_tcp:listen(8080, [binary, {active, false}, {reuseaddr, true}]),
    listen(ServerSocket).