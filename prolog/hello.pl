say_hello_to(Name) :-
  format('Hello ~w!~n', [Name]).

name(Name) :-
  say_hello_to(Name).
