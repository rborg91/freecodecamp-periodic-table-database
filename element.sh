#!/bin/bash

# Check if an argument is provided
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

# Connect to PostgreSQL and fetch element details
RESULT=$(psql --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c "
SELECT e.atomic_number, e.symbol, e.name, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
FROM elements e
JOIN properties p ON e.atomic_number = p.atomic_number
JOIN types t ON p.type_id = t.type_id
WHERE e.atomic_number::text = '$1' OR e.symbol ILIKE '$1' OR e.name ILIKE '$1';" | sed 's/^[ \t]*//;s/[ \t]*$//')

# Check if a result was found
if [[ -z $RESULT ]]; then
  echo "I could not find that element in the database."
  exit 0
fi

# Format and print the result on one line
IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME TYPE MASS MELTING BOILING <<< "$RESULT"
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
