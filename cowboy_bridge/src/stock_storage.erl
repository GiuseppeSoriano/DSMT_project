-module(stock_storage).
-behaviour(gen_server).

-export([start_link/0, update_stock/2, get_stock/1, get_all_tickers/0]).
-export([init/1, handle_call/3, handle_cast/2, terminate/2, code_change/3]).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

update_stock(Ticker, StockInfo) ->
    gen_server:cast(?MODULE, {update_stock, Ticker, StockInfo}).

get_stock(Ticker) ->
    gen_server:call(?MODULE, {get_stock, Ticker}).

get_all_tickers() ->
    gen_server:call(?MODULE, get_all_tickers).

init([]) ->
    {ok, #{}}.

handle_cast({update_stock, Ticker, StockInfo}, State) ->
    %% stampa a video il messaggio ricevuto
%%    io:format("Messaggio ricevuto: ~p~n", [StockInfo]),
    NewState = maps:put(Ticker, StockInfo, State),
    {noreply, NewState}.

handle_call({get_stock, Ticker}, _From, State) ->
    StockInfo = maps:get(Ticker, State, undefined),
    {reply, StockInfo, State};
handle_call(get_all_tickers, _From, State) ->
    Tickers = maps:keys(State),
    {reply, Tickers, State}.


terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
