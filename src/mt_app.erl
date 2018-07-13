%%%-------------------------------------------------------------------
%% @doc mt public API
%% @end
%%%-------------------------------------------------------------------

-module(mt_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1, test_fn/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    mt_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================

test_fn(Arg) -> {not_mocked, Arg}.