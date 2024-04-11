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
        {Ticker, Price, Timestamp} ->
            io:format("Messaggio ricevuto da ~p: ~p at ~p~n", [Ticker, Price, Timestamp]),
            %% Inoltra a internal_comm_manager
            internal_comm_manager:handle_stock_info(Ticker, Price, Timestamp),
            loop()
    end.
