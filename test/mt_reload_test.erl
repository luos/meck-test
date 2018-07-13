-module(mt_reload_test).
-include_lib("eunit/include/eunit.hrl").

-compile(export_all).

proc_fn() ->
    receive
        {do_call, Arg} ->
            ?debugFmt("[~p] called: ~p~n", [self(), mt_app:test_fn(Arg)])
    end,
    proc_fn().

reload_test() ->
    Proc = spawn(fun proc_fn/0),
    meck:new(mt_app, [passtrough]),
    meck:expect(mt_app, test_fn, fun(Arg) -> {mocked, Arg} end),
    spawn(fun() ->
            lists:map(fun(N) ->
                        timer:sleep(1),
                        Proc ! {do_call, N}
                     end, lists:seq(0, 3))
          end),

    meck:expect(mt_app, test_fn, fun(Arg) -> {mocked2, Arg} end),
    timer:sleep(1000),
    ?debugFmt("History: ~p~n",[meck:history(mt_app)]),
    ?assertEqual(4, meck:num_calls(mt_app, test_fn, '_'))
    .
