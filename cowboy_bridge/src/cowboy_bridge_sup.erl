%%%-------------------------------------------------------------------
%% @doc cowboy_bridge top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(cowboy_bridge_sup).

-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->
    Port = 8081,
    Routes = [
        {"/websocket", websocket_handler, []}
    ],
    Dispatch = cowboy_router:compile([{ '_', Routes }]),
    CowboyChildSpec = #{id => cowboy,
                        start => {cowboy, start_clear, [http, [{port, Port}], #{env => #{dispatch => Dispatch}}]},
                        restart => permanent,
                        shutdown => 5000,
                        type => worker,
                        modules => [cowboy]},
    MessageReceiverChildSpec = #{id => message_receiver,
                                 start => {message_receiver, start, []},
                                 restart => permanent,
                                 shutdown => 5000,
                                 type => worker,
                                 modules => [message_receiver]},
    InternalCommManagerChildSpec = #{id => internal_comm_manager,
                                     start => {internal_comm_manager, start_link, []},
                                     restart => permanent,
                                     shutdown => 5000,
                                     type => worker,
                                     modules => [internal_comm_manager]},
    StockStorageChildSpec = #{id => stock_storage,
                              start => {stock_storage, start_link, []},
                              restart => permanent,
                              shutdown => 5000,
                              type => worker,
                              modules => [stock_storage]},

    SupFlags = #{strategy => one_for_one,
                 intensity => 1,
                 period => 5},
    {ok, {SupFlags, [CowboyChildSpec, MessageReceiverChildSpec, InternalCommManagerChildSpec, StockStorageChildSpec]}}.
