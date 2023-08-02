#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_SEARCH=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1")
  else
    SYMBOL_SEARCH=$($PSQL "SELECT * FROM elements WHERE symbol = '$1'")
    NAME_SEARCH=$($PSQL "SELECT * FROM elements WHERE name = '$1'")
  fi
  if [[ -z $ATOMIC_SEARCH && -z $SYMBOL_SEARCH && -z $NAME_SEARCH ]]
  then
    echo I could not find that element in the database.
  else
    if [[ ! -z $ATOMIC_SEARCH ]]
    then
      ELEMENT_SEARCH=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")
    else if [[ ! -z $SYMBOL_SEARCH ]]
    then 
      ELEMENT_SEARCH=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1'")
    else
      ELEMENT_SEARCH=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$1'")
    fi
  fi
  IFS='|'
  echo "$ELEMENT_SEARCH" | while read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
  do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
  unset IFS
  fi
fi
