beats(rock, scissors, 'Rock smashes scissors.').
beats(paper, rock, 'Paper smothers rock.').
beats(scissors, paper, 'Scissors cut paper.').
beats(X, X, 'It\'s a draw!').

score(DrawnChoice, DrawnChoice, Message, 'No winner.') :-
  beats(DrawnChoice, DrawnChoice, Message).

score(Choice, OpponentChoice, Message, 'You win.') :-
  beats(Choice, OpponentChoice, Message).

score(Choice, OpponentChoice, Message, 'You lose.') :-
  beats(OpponentChoice, Choice, Message).

play(Choice) :-
  random_member(OpponentChoice, [rock, paper, scissors]),
  score(Choice, OpponentChoice, Message, Result),
  format('You chose: ~w~n', [Choice]),
  format('They chose: ~w~n~n', [OpponentChoice]),
  format('~w~n~w~n', [Message, Result]).
