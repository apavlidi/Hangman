
# Hangman

## The familiar hangman game build in Prolog: "Player 1 (or PC) selects a word (or phrase) and player 2 tries to guess it".

Player 1 presents the form of the word, displaying the first and last letter of the word as well as the number of letters that are mediated, e.g. program p _ _ _ _ _ m (for the word program)

### The rules of the game are as follows:
 * Player 2 has a certain number of attempts (usually from 4 to 6) to guess the letters of the word, one in every effort.
 * If he correctly guesses a letter, it appears in the corresponding positions of the word and the game continues, without reducing the number of available attempts.
 * If he does not guess correctly, he loses one of the available efforts and if the game is not reset, the game continues.
 * If he tries to guess a letter he has already mentioned in his previous attempt, he is informed that the letter has already been selected, the number of available efforts is not diminishing, and the game continues.
 * If the number of attempts to reset the game ends with a "failure" (player 2 is hung).
 * If player 2 guesses all the letters of the word before the number of available attempts is reset, the game ends with "success".
