#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  # PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
  PSQL="psql --username=postgres --dbname=worldcup -t --no-align -c"
fi


# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; 
do
  if [[ $YEAR != "year" ]]
  then
    # get team ids
    #echo $($PSQL "SELECT team_id FROM teams")
    
    # get the winner id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if not found
    if [[ -z $WINNER_ID ]]
    then
      WINNER_ID_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
      # Echo to terminal
      if [[ $WINNER_ID_RESULT = "INSERT 0 1" ]]
        then
          echo Added $WINNER to teams
      fi

      # get new winner_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # get the opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    #if not found
    if [[ -z $OPPONENT_ID ]]
    then
      OPPONENT_ID_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      # Echo to terminal
      if [[ $OPPONENT_ID_RESULT = "INSERT 0 1" ]]
        then
          echo Added $OPPONENT to teams
      fi

      # get new opponent_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # insert into games
    GAMES_RESULTS=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', '$WINNER_ID', '$OPPONENT_ID', $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $GAMES_RESULTS = "INSERT 0 1" ]]
    then
      echo Added $YEAR, $ROUND, $WINNER, $OPPONENT, $WINNER_GOALS, $OPPONENT_GOALS to games
    fi
  fi
done