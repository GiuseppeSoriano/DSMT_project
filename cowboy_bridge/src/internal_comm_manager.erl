-module(internal_comm_manager).
-behaviour(gen_server).

-export([start_link/0, handle_stock_info/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

handle_stock_info(Ticker, StockInfo) ->
    gen_server:cast(?MODULE, {stock_info, Ticker, StockInfo}).

init([]) ->
    {ok, #{}}.

handle_cast({stock_info, Ticker, StockInfo}, State) ->
    stock_storage:update_stock(Ticker, StockInfo), %% Assumi che abbiamo un ticker di esempio
    {noreply, State}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVersion, State, _Extra) ->
    {ok, State}.
