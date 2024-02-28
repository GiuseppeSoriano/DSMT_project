%% RECEIVES MESSAGE FROM THE SERVER

-module(message_receiver).
-export([start/0, loop/0]).

start() ->
    Pid = spawn(?MODULE, loop, []),
    register(message_receiver, Pid),
    {ok, Pid}.

loop() ->
    receive
        {From, Message} ->
            io:format("Messaggio ricevuto da ~p: ~p~n", [From, Message]),
            loop()
    end.
