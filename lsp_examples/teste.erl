-module(complex_hello).
-export([hello/0]).

hello() ->
    io:format("Enter your name: "),
    {ok, [Name | _]} = io:fread("~s", []),
    io:format("Hello, ~s! Welcome to the complex Erlang program.~n", [Name]).

