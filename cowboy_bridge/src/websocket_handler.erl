-module(websocket_handler).
-behaviour(cowboy_websocket).
-export([init/2, websocket_init/1, websocket_handle/2, websocket_info/2, terminate/3]).

init(Req, State) ->
    {cowboy_websocket, Req, State}.

websocket_init(State) ->
    % Inizializza l'invio dell'ora attuale
    erlang:send_after(1000, self(), send_time),
    {ok, State}.

websocket_handle({text, _Text}, State) ->
    % Qui gestiremo i messaggi in arrivo dal client, per ora semplicemente li ignoriamo.
    {ok, State};
websocket_handle(_, State) -> 
    {ok, State}.

websocket_info(send_time, State) ->
    {Frames, State} = send_current_time(State),
    % Reimposta il timer per inviare l'ora ogni secondo
    erlang:send_after(1000, self(), send_time),
    {Frames, State}.

send_current_time(State) ->
    {{Year, Month, Day}, {Hour, Minute, Second}} = calendar:local_time(),
    DateTimeStr = io_lib:format("~4..0w-~2..0w-~2..0wT~2..0w:~2..0w:~2..0w",
                                [Year, Month, Day, Hour, Minute, Second]),
    DateTimeBin = list_to_binary(lists:flatten(DateTimeStr)),
    Msg = jsx:encode(#{<<"time">> => DateTimeBin}),
    {[{text, Msg}], State}.




terminate(_Reason, _Req, _State) ->
    % Qui possiamo gestire la terminazione della connessione, per ora semplicemente logghiamo.
    ok.
