#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER=$((1 + $RANDOM % 1000))

echo Enter your username:
read USERNAME

USERNAME_FIND=$($PSQL "SELECT username FROM player WHERE username = '$USERNAME'")
echo 
if [[ -z $USERNAME_FIND ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO player(username, games_played, best_game) VALUES ('$USERNAME', 0, 0)")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM player WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM player WHERE username='$USERNAME'")
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
  ((GAMES_PLAYED++))
  UPDATE_GAMES=$($PSQL "UPDATE player SET games_played = $GAMES_PLAYED WHERE username='$USERNAME'")
fi
echo "Guess the secret number between 1 and 1000:"
read USER_CHOICE
COUNT=0

until [[ $RANDOM_NUMBER == $USER_CHOICE ]]
do
  if [[ ! $USER_CHOICE =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
    read USER_CHOICE
    ((COUNT++))
  else
    if [[ $USER_CHOICE < $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      read USER_CHOICE 
      ((COUNT++))
    else
      echo "It's lower than that, guess again:"
      read USER_CHOICE 
      ((COUNT++))
    fi
  fi
done
((COUNT++))
echo $($PSQL "UPDATE player SET best_game=$COUNT WHERE username='$USERNAME'")
echo "You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
