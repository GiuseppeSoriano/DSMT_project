-module(my_http_handler).
-behaviour(cowboy_handler).
-export([init/2]).

init(Req, State) ->
    % Controlla il tipo di richiesta
    case cowboy_req:method(Req) of
        % Se è una richiesta GET
        <<"GET">> ->
            % Rispondi con un messaggio di testo
            {ok, Req2} = cowboy_req:reply(200, #{}, <<"Hello from Cowboy!">>, Req),
            {ok, Req2, State};
        % Se è una richiesta POST
        <<"POST">> ->
            % Legge il corpo della richiesta
            {ok, Body, Req1} = cowboy_req:read_body(Req),
            % Decodifica il corpo della richiesta da application/x-www-form-urlencoded a una lista di parametri
            Params = cowboy_req:parse_qs(Body),
            % Estrae il valore del parametro specifico
            ParametroValue = proplists:get_value(<<"parametro">>, Params, undefined),
            % Stampa il valore del parametro
            io:format("Valore parametro: ~p~n", [ParametroValue]),
            % Invia una risposta al client
            {ok, Req2} = cowboy_req:reply(200, #{}, <<"POST request processed">>, Req1),
            {ok, Req2, State}


            % {ok, Params, Req2} = cowboy_req:qs(Req),
            % io:format("Parametro: ~p~n", [proplists:get_value(<<"parametro">>, Params)]),
            % case proplists:get_value(<<"parametro">>, Params) of
            %     % Se il parametro è uguale a "subscribe"
            %     <<"subscribe">> ->
            %         % Rispondi con un messaggio di testo
            %         {ok, Req3} = cowboy_req:reply(200, #{}, <<"Valore corretto!">>, Req2),
            %         {ok, Req3, State};
            %     % Se il parametro è diverso da "subscribe"
            %     _ ->
            %         % Rispondi con un messaggio di testo
            %         {ok, Req3} = cowboy_req:reply(200, #{}, <<"Valore errato!">>, Req2),
            %         {ok, Req3, State}
            % end
    end.
