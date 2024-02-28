-module(websocket_handler).
-behaviour(cowboy_websocket).
-export([init/2, websocket_init/1, websocket_handle/2, websocket_info/2, terminate/3]).

init(Req, _Opts) ->
    erlang:send_after(1000, self(), {send_time, self()}),
    erlang:send_after(1000, self(), {send_random, self()}),
    {cowboy_websocket, Req, #{}}.

websocket_init(State) ->
    % Inizializza l'invio dell'ora attuale e prepara la possibilità di inviare un numero casuale
    State1 = maps:put(subscribe_time, false, State),
    State2 = maps:put(subscribe_random, false, State1),
    {ok, State2}.

websocket_handle({text, <<"ping">>}, State) ->
    %% Gestisci il ping qui, ad esempio inviando un pong o semplicemente ignorandolo.
    {ok, State};
websocket_handle({ping, Payload}, State) ->
    %% Rispondi al ping con un pong con lo stesso payload.
    {pong, Payload, State};
websocket_handle({text, Msg}, State) ->
    case Msg of
        <<"subscribe_time">> ->
            io:format("Subscribed to time updates~n"),
            erlang:send_after(1000, self(), {send_time, self()}),
            {ok, maps:put(subscribe_time, true, State)};
        <<"subscribe_random">> ->
            io:format("Subscribed to random number updates~n"),
            erlang:send_after(1000, self(), {send_random, self()}),
            {ok, maps:put(subscribe_random, true, State)}
    end;
websocket_handle(_, State) -> 
    {ok, State}.


websocket_info({send_time, _Ref}, State) ->
    case maps:get(subscribe_time, State, false) of
        true ->
            {Frames, StateUpdated} = send_current_time(State),
            erlang:send_after(1000, self(), {send_time, self()}),
            {Frames, StateUpdated};
        false ->
            erlang:send_after(1000, self(), {send_time, self()}),
            {[], State}
    end;
websocket_info({send_random, _Ref}, State) ->
    case maps:get(subscribe_random, State, false) of
        true ->
            {Frames, StateUpdated} = send_random_number(State),
            erlang:send_after(1000, self(), {send_random, self()}),
            {Frames, StateUpdated};
        false ->
            erlang:send_after(1000, self(), {send_random, self()}),
            {[], State}
    end;
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
