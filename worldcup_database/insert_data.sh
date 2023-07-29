#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")


cat games.csv | while IFS="," read YEAR ROUND WIN OPP WIN_GOALS OPP_GOALS
do
  if [[ $WIN != "winner" ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WIN'")
    
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WIN')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo $WIN was inserted into the database
      fi
    fi
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WIN'")
  fi
  
  if [[ $OPP != "opponent" ]]
  then
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")
    
    if [[ -z $OPP_ID ]]
    then
      INSERT_LOSER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPP')")
      if [[ $INSERT_LOSER_RESULT == "INSERT 0 1" ]]
      then
        echo $OPP was inserted into the database
      fi
    fi
    OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")
  fi
  if [[ $YEAR != "year" ]]
  then
    GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', $WINNER_ID, $OPP_ID, $WIN_GOALS, $OPP_GOALS)")
    if [[ $GAME_RESULT == "INSERT 0 1" ]]
    then
      echo Game was inserted into the database
    fi 
  fi
done
