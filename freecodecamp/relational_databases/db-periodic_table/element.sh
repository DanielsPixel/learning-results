#!/bin/bash
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else  
  PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only --quiet -c"
  if [[ $1 =~ [a-zA-Z] && ${#1} -lt 3 ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
  elif [[ $1 =~ [a-zA-Z] ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
  else
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
  fi
  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo "I could not find that element in the database."
  else
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    MASS="$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")"
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    PART_ONE="The element with atomic number $ATOMIC_NUMBER is $NAME ($(echo "$SYMBOL" | sed 's/ //g')). It's a nonmetal, with a mass of $MASS amu."
    PART_TWO="$NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    echo $PART_ONE $PART_TWO
  fi
fi