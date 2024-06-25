#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t -q --no-align -c"

START_GAME() {
  NUMBER_TO_GUESS=$((RANDOM % 1000))
  GUESS_COUNT=0
  echo "Guess the secret number between 1 and 1000:"
  while (true)
  do
    read GUESSED_NUMBER
    (( GUESS_COUNT++ ))
    if [[ $GUESSED_NUMBER =~ [a-zA-Z] ]]
    then
      echo -e "That is not an integer, guess again:"
    elif [[ $NUMBER_TO_GUESS -lt $GUESSED_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $NUMBER_TO_GUESS -gt $GUESSED_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "You guessed it in $GUESS_COUNT tries. The secret number was $NUMBER_TO_GUESS. Nice job!"
      ($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES ($USER_ID, $GUESS_COUNT)")
      break
    fi

  done
}

echo -e "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  ($PSQL "INSERT INTO users(name) VALUES ('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
  START_GAME
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id=$USER_ID")
  BEST_GAME_SCORE=$($PSQL "SELECT MAX(number_of_guesses) FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME_SCORE guesses."
  START_GAME
fi  


