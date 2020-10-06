-module(dialog).

-export([dialog/0]).

dialog() ->
    io:format('Hello man! What is your name?~n'),
    {_, [Name]} = io:fread("My name is: ", "~s"),
    {_, [Age]} = io:fread("How old are you, ", "~s"),
    Description =
	io:get_line("Write something about yourself: "),
    {_, File} = file:open("About,txt", [write]),
    io:fwrite(File, "~s",
	      string:join(["~nMy name is: ", Name], " ")),
    io:fwrite(File, "~s",
	      string:join(["~nMy age is: ", Age], " ")),
    io:fwrite(File, "~s",
	      string:join(["~nSome words about myself: ",
			   Description],
			  " ")),
    halt().
