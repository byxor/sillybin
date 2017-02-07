score(X, X, 'You win!').
score(X, Y, 'You lose.').

play(Low, High, Guess) :-
  random_between(Low, High, Actual),
  score(Guess, Actual, Message),
  format('You guessed ~w~n', [Guess]),
  format('The answer was ~w~n', [Actual]),
  format('~w~n', [Message]).
