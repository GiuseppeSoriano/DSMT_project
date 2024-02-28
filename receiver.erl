-module(receiver).
-export([start/0, loop/0]).

start() ->
    register(receiver, spawn(receiver, loop, [])).

loop() ->
    receive
        Message ->
            io:format("Ricevuto: ~p~n", [Message]),
            loop()
    end.
