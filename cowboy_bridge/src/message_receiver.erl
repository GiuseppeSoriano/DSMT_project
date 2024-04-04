%% RECEIVES MESSAGE FROM THE SERVER

-module(message_receiver).
-export([start/0, loop/0, status/0]).

start() ->
    Pid = spawn(?MODULE, loop, []),
    register(message_receiver, Pid),
    {ok, Pid}.

status() ->
    case is_process_alive(whereis(message_receiver)) of
        true -> io:format("Active process~n");
        false -> io:format("Inactive process~n")
    end.

loop() ->
    receive
        {From, Message} ->
            io:format("Messaggio ricevuto da ~p: ~p~n", [From, Message]),
            loop()
    end.
