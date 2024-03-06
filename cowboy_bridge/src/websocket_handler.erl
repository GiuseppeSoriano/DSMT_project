-module(websocket_handler).
-behaviour(cowboy_websocket).
-export([init/2, websocket_init/1, websocket_handle/2, websocket_info/2, terminate/3]).

init(Req, _Opts) ->
    % erlang:send_after(1000, self(), tick), % Avvia un timer centralizzato
    {cowboy_websocket, Req, #{}}.

websocket_init(State) ->
    State1 = maps:put(subscribe_time, false, State),
    State2 = maps:put(subscribe_random, false, State1),
    erlang:send_after(1000, self(), tick),
    {ok, State2}.

websocket_handle({text, <<"ping">>}, State) ->
    {ok, State};
websocket_handle({ping, Payload}, State) ->
    {pong, Payload, State};
websocket_handle({text, Msg}, State) ->
    case Msg of
        <<"subscribe_time">> ->
            io:format("Subscribed to time updates~n"),
            {ok, maps:put(subscribe_time, true, State)};
        <<"subscribe_random">> ->
            io:format("Subscribed to random number updates~n"),
            {ok, maps:put(subscribe_random, true, State)};
        <<"unsubscribe_time">> ->
            io:format("Unsubscribed from time updates~n"),
            {ok, maps:put(subscribe_time, false, State)};
        <<"unsubscribe_random">> ->
            io:format("Unsubscribed from random number updates~n"),
            {ok, maps:put(subscribe_random, false, State)}
    end;
websocket_handle(_, State) -> 
    {ok, State}.

websocket_info(tick, State) -> % Gestisci il tick del timer centralizzato
    {FramesTime, State1} = case maps:get(subscribe_time, State, false) of
        true -> send_current_time(State);
        false -> {[], State}
    end,
    {FramesRandom, State2} = case maps:get(subscribe_random, State1, false) of
        true -> send_random_number(State1);
        false -> {[], State1}
    end,
    erlang:send_after(1000, self(), tick), % Riavvia il timer centralizzato
    {FramesTime ++ FramesRandom, State2}; % Invia tutti i frame accumulati
websocket_info(_Info, State) ->
    {ok, State}.

send_current_time(State) ->
    {{Year, Month, Day}, {Hour, Minute, Second}} = calendar:local_time(),
    DateTimeStr = io_lib:format("~4..0w-~2..0w-~2..0wT~2..0w:~2..0w:~2..0w",
                                [Year, Month, Day, Hour, Minute, Second]),
    DateTimeBin = list_to_binary(lists:flatten(DateTimeStr)),
    Msg = jsx:encode(#{<<"time">> => DateTimeBin}),
    {[{text, Msg}], State}.

send_random_number(State) ->
    RandomNum = rand:uniform(100), % Genera un numero casuale tra 1 e 100
    Msg = jsx:encode(#{<<"random">> => RandomNum}),
    {[{text, Msg}], State}.

terminate(_Reason, _Req, _State) ->
    % Qui possiamo gestire la terminazione della connessione, per ora semplicemente logghiamo.
    ok.
