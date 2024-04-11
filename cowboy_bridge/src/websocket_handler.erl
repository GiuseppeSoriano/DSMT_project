-module(websocket_handler).
-behaviour(cowboy_websocket).
-export([init/2, websocket_init/1, websocket_handle/2, websocket_info/2, terminate/3]).

init(Req, _Opts) ->
    register(websocket_handler, self()),
    {cowboy_websocket, Req, #{}}.

websocket_init(State) ->
    State1 = maps:put(subscribe_time, false, State),
    State2 = maps:put(subscribe_random, false, State1),
    State3 = maps:put(subscribe_stock, {false, undefined}, State2),
    erlang:send_after(1000, self(), tick),
    {ok, State3}.

websocket_handle({text, <<"ping">>}, State) ->
%%    io:format("Ping text received~n"),
    {ok, State};
websocket_handle({text, <<"subscribe_time">>}, State) ->
    io:format("Subscribed to time updates~n"),
    {ok, maps:put(subscribe_time, true, State)};
websocket_handle({text, <<"unsubscribe_time">>}, State) ->
    io:format("Unsubscribed from time updates~n"),
    {ok, maps:put(subscribe_time, false, State)};
websocket_handle({text, <<"subscribe_random">>}, State) ->
    io:format("Subscribed to random number updates~n"),
    {ok, maps:put(subscribe_random, true, State)};
websocket_handle({text, <<"unsubscribe_random">>}, State) ->
    io:format("Unsubscribed from random number updates~n"),
    {ok, maps:put(subscribe_random, false, State)};
websocket_handle({text, Msg}, State) ->
    case jsx:decode(Msg, [return_maps]) of
        #{<<"type">> := <<"subscribe_stock">>, <<"ticker">> := Ticker} ->
            TickerStr = binary_to_list(Ticker),
            io:format("Subscribed to stock updates for ~p~n", [TickerStr]),
            {ok, maps:put(subscribe_stock, {true, TickerStr}, State)};
        #{<<"type">> := <<"unsubscribe_stock">>, <<"ticker">> := Ticker} ->
            TickerStr = binary_to_list(Ticker),
            io:format("Unsubscribed from stock updates for ~p~n", [TickerStr]),
            {ok, maps:put(subscribe_stock, {false, undefined}, State)};
        _Other ->
            io:format("Unknown message type: ~p~n", [Msg]),
            % Gestire altri tipi di messaggi qui
            {ok, State}
    end;
websocket_handle(_, State) -> 
    {ok, State}.

websocket_info(tick, State) ->
    {FramesTime, State1} = send_current_time(State),
    {FramesRandom, State2} = send_random_number(State1),
    {FramesStock, State3} = send_stock(State2),
    erlang:send_after(1000, self(), tick),
    {FramesTime ++ FramesRandom ++ FramesStock, State3}; % Invia tutti i frame accumulati
websocket_info(_Info, State) ->
    {ok, State}.

send_current_time(State) ->
    case maps:get(subscribe_time, State, false) of
        true ->
            {{Year, Month, Day}, {Hour, Minute, Second}} = calendar:local_time(),
            DateTimeStr = io_lib:format("~4..0w-~2..0w-~2..0wT~2..0w:~2..0w:~2..0w",
                                        [Year, Month, Day, Hour, Minute, Second]),
            DateTimeBin = list_to_binary(lists:flatten(DateTimeStr)),
            Msg = jsx:encode(#{<<"time">> => DateTimeBin}),
            {[{text, Msg}], State};
        false ->
            {[], State}
    end.

send_random_number(State) ->
    case maps:get(subscribe_random, State, false) of
        true ->
            RandomNum = rand:uniform(100),
            Msg = jsx:encode(#{<<"random">> => RandomNum}),
            {[{text, Msg}], State};
        false ->
            {[], State}
    end.

send_stock(State) ->
    case maps:get(subscribe_stock, State, {false, undefined}) of
        {true, TickerStr} when is_list(TickerStr) ->
            Ticker = list_to_atom(TickerStr), %% Converti la stringa in atomo
            TickerBinary = list_to_binary(TickerStr), 
            StockInfo = stock_storage:get_stock(Ticker),
            %% io:format("Sending stock update for ~p: ~p~n", [Ticker, StockInfo]),
            StockString = io_lib:format("~p", [StockInfo]),
            StockBinary = list_to_binary(StockString),
            Msg = jsx:encode(#{TickerBinary => StockBinary}),
            {[{text, Msg}], State};
        _ ->
            {[], State}
    end.

terminate(_Reason, _Req, _State) ->
    ok.
