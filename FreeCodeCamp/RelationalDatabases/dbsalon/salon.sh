#!/bin/bash
PSQL=("psql --username=freecodecamp --dbname=salon --tuples-only --quiet -c  ")
SERVICES_RESULT=$($PSQL "SELECT service_id, name FROM services")
TOTAL_SERVICES=$($PSQL "SELECT COUNT(name) FROM services")
SERVICE_ID_SELECTED=
CUSTOMER_NAME=
CUSTOMER_PHONE=
CUSTOMER_ID=
SERVICE_TIME=

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

SHOW_SERVICES(){
  echo "$SERVICES_RESULT" | while IFS=" | " read SERVICE_ID SERVICE 
  do
    echo "$SERVICE_ID) $SERVICE"
  done  
}
REGISTER_APPOINTMENT (){
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME        
  ($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES ('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $(echo $CUSTOMER_NAME | xargs)."
}
SHOW_SERVICES
read SERVICE_ID_SELECTED
SERVICE_ID_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
if [[ ! $SERVICE_ID_SELECTED =~ [a-zA-Z] ]] && [[ ! -z $SERVICE_ID_SELECTED ]]
then
  echo -e "\nWhat's your phone number?"    
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")    
  if [[ ! -z $CUSTOMER_ID ]]
  then
    
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")
    REGISTER_APPOINTMENT
  else
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    $PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    REGISTER_APPOINTMENT
  fi  
else
  echo -e "\nI could not find that service. What would you like today?"
  SHOW_SERVICES
  
fi 
  
