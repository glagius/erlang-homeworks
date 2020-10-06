-module(dialog).

-export([start/0]).

start() ->
    io:format("Hello man! What is your name?~n"),
    {_, [Name]} = io:fread("My name is: ", "~s"),
    {_, [Age]} = io:fread("How old are you, ", "~s"),
    Description =
	io:get_line("Write something about yourself: "),
    {_, File} = file:open("About.txt", [write]),
    io:fwrite(File, "~s", ["\nMy name is: "]),
    io:fwrite(File, "~s", [Name]),
    io:fwrite(File, "~s", ["\nMy age is: "]),
    io:fwrite(File, "~s", [Age]),
    io:fwrite(File, "~s", ["\nSome words about myself: "]),
    io:fwrite(File, "~s", [Description]),
    halt().
