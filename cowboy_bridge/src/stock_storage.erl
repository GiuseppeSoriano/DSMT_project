-module(stock_storage).
-behaviour(gen_server).

-export([start_link/0, update_stock/3, get_stock/1, get_all_tickers/0]).
-export([init/1, handle_call/3, handle_cast/2, terminate/2, code_change/3]).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

update_stock(Ticker, Price, Timestamp) ->
    gen_server:cast(?MODULE, {update_stock, Ticker, Price, Timestamp}).

get_stock(Ticker) ->
    gen_server:call(?MODULE, {get_stock, Ticker}).

get_all_tickers() ->
    gen_server:call(?MODULE, get_all_tickers).

init([]) ->
    {ok, #{}}.

handle_cast({update_stock, Ticker, Price, Timestamp}, State) ->
    %% Determina se aggiornare lo stato in base al timestamp
    NewState = case maps:find(Ticker, State) of
                   {ok, {_, StoredTimestamp}} when Timestamp > StoredTimestamp ->
                       %% Il nuovo timestamp è maggiore, quindi aggiorna
                       maps:put(Ticker, {Price, Timestamp}, State);
                   error ->
                       %% Ticker non presente, quindi inserisci nuovo valore
                       maps:put(Ticker, {Price, Timestamp}, State);
                   _ ->
                       %% Il timestamp esistente è maggiore o uguale, non aggiornare
                       State
               end,

    {noreply, NewState}.



handle_call({get_stock, Ticker}, _From, State) ->
    StockInfo = case maps:get(Ticker, State, undefined) of
                    {Price, _Timestamp} -> 
                        %% Restituisci solo il prezzo
                        Price;
                    undefined -> 
                        %% Se il ticker non è trovato, gestisci come preferisci
                        %% ad esempio restituendo undefined o un messaggio di errore
                        undefined
                end,
    {reply, StockInfo, State};


handle_call(get_all_tickers, _From, State) ->
    Tickers = maps:keys(State),
    {reply, Tickers, State}.


terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
