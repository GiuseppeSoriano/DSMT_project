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
    Port = 8080,
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

    SupFlags = #{strategy => one_for_one,
                 intensity => 1,
                 period => 5},
    {ok, {SupFlags, [CowboyChildSpec, MessageReceiverChildSpec]}}.



%% internal functions
