neverGoingTo(giveYouUp).
neverGoingTo(letYouDown).
neverGoingTo(runAroundAndDesertYou).
neverGoingTo(makeYouCry).
neverGoingTo(sayGoodbye).
neverGoingTo(tellALieAndHurtYou).


/* Simply provide a list of things your man says he'll do and this function
 * will tell you if he's Rick Astley.
 * E.g. checkForRickAstley([waterPlants, danceBadly, makeYouCry]) => False!
 */
checkForRickAstley([]).
checkForRickAstley([I|L]) :- not(neverGoingTo(I)), checkForRickAstley(L). 
