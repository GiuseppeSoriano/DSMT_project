-module(websocket_handler).
-behaviour(cowboy_websocket).
-export([init/2, websocket_init/1, websocket_handle/2, websocket_info/2, terminate/3]).

init(Req, _Opts) ->
    register(websocket_handler, self()),
    {cowboy_websocket, Req, #{}}.

websocket_init(State) ->
    State3 = maps:put(subscribe_stock, #{}, State),
    erlang:send_after(1000, self(), tick),
    {ok, State3}.

websocket_handle({text, <<"ping">>}, State) ->
    {ok, State};
websocket_handle({text, Msg}, State) ->
    case jsx:decode(Msg, [return_maps]) of
        #{<<"type">> := <<"subscribe_stock">>, <<"ticker">> := Ticker} ->
            TickerStr = binary_to_list(Ticker),
            io:format("Subscribed to stock updates for ~p~n", [TickerStr]),
            Stocks = maps:get(subscribe_stock, State, #{}),
            {ok, maps:put(subscribe_stock, Stocks#{TickerStr => true}, State)};
        #{<<"type">> := <<"unsubscribe_stock">>, <<"ticker">> := Ticker} ->
            TickerStr = binary_to_list(Ticker),
            io:format("Unsubscribed from stock updates for ~p~n", [TickerStr]),
            Stocks = maps:get(subscribe_stock, State, #{}),
            {ok, maps:put(subscribe_stock, maps:remove(TickerStr, Stocks), State)};
        _Other ->
            io:format("Unknown message type: ~p~n", [Msg]),
            {ok, State}
    end;
websocket_handle(_, State) -> 
    {ok, State}.

websocket_info(tick, State) ->
    {FramesStock, State3} = send_stock(State),
    erlang:send_after(1000, self(), tick),
    {FramesStock, State3}; % Return stock updates
websocket_info(_Info, State) ->
    {ok, State}.

send_stock(State) ->
    Stocks = maps:get(subscribe_stock, State, #{}),
    case is_map(Stocks) of
        true ->
            Frames = lists:foldl(fun(TickerStr, Acc) ->
                                     case stock_storage:get_stock(list_to_atom(TickerStr)) of
                                         undefined ->
                                             Acc; % No update if ticker not found
                                         StockInfo ->
                                             StockString = io_lib:format("~p", [StockInfo]),
                                             StockBinary = list_to_binary(StockString),
                                             Msg = jsx:encode(#{list_to_binary(TickerStr) => StockBinary}),
                                             [{text, Msg} | Acc]
                                     end
                                 end, [], maps:keys(Stocks)),
            {Frames, State};
        false ->
            % If not a map, return empty list
            {[], State}
    end.

terminate(_Reason, _Req, _State) ->
    ok.
