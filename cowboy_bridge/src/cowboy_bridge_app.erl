-module(cowboy_bridge_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    cowboy_bridge_sup:start_link().

stop(_State) ->
    ok.

%% internal functions

%% rebar3 shell --name cowboy_bridge@172.27.187.216 --setcookie mycookie
