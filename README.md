mt
=====

The mt_reload_test.erl file contains a test
to show that there are some conditions when history is
not recorded.

Run it with `rebar3 eunit`

Output:

```
➜  mt rebar3 eunit
===> Verifying dependencies...
===> Compiling mt
_build/test/lib/mt/test/mt_reload_test.erl:4: Warning: export_all flag enabled - all functions will be exported

===> Performing EUnit tests...
/_build/test/lib/mt/test/mt_reload_test.erl:9:<0.137.0>: [<0.137.0>] called: {mocked2,0}

/_build/test/lib/mt/test/mt_reload_test.erl:9:<0.137.0>: [<0.137.0>] called: {mocked2,1}

/_build/test/lib/mt/test/mt_reload_test.erl:9:<0.137.0>: [<0.137.0>] called: {mocked2,2}

/_build/test/lib/mt/test/mt_reload_test.erl:9:<0.137.0>: [<0.137.0>] called: {mocked2,3}

/_build/test/lib/mt/test/mt_reload_test.erl:26:<0.132.0>: History: [{<0.137.0>,{mt_app,test_fn,[1]},{mocked2,1}},
          {<0.137.0>,{mt_app,test_fn,[2]},{mocked2,2}},
          {<0.137.0>,{mt_app,test_fn,[3]},{mocked2,3}}]

F
Failures:

mt
  1) mt_reload_test:reload_test/0: module 'mt_reload_test'
     Failure/Error: ?assertEqual(4, meck : num_calls ( mt_app , test_fn , '_' ))
       expected: 4
            got: 3
     %% /_build/test/lib/mt/test/mt_reload_test.erl:27:in `mt_reload_test:-reload_test/0-fun-5-/0`
     Output:
     Output:


Top 1 slowest tests (1.030 seconds, 93.6% of total time):
  mt_reload_test:reload_test/0: module 'mt_reload_test'
    1.030 seconds

Finished in 1.101 seconds
1 tests, 1 failures
===> Error running tests

```


An OTP application

Build
-----

    $ rebar3 compile
# meck-test
