#!/bin/bash
COLOR_RED='\033[1;31m';
COLOR_GREEN='\033[1;32m';
COLOR_BLUE='\033[1;36m';
COLOR_YELLOW='\033[1;49;33m';
COLOR_DARK_GRAY='\033[1;90m';
COLOR_CLEAN='\033[0m';

PROJECT_NAME=$1

print() {
echo
echo -e "${COLOR_YELLOW}$@${COLOR_CLEAN}"
}

execute() {
_COMMAND=$@
print "time $_COMMAND"
echo -e $COLOR_GREEN$(date)$COLOR_CLEAN
time eval "$_COMMAND"
if [ $? -ne 0 ]; then
    exit 1
fi
}

example() {
echo -e "${COLOR_DARK_GRAY}=================================="
echo "How to use it:"
echo "	./create-project <PROJECT_NAME> "
echo
echo " example:"
echo "	./create-project laravel/laravel"
echo -e "==================================${COLOR_CLEAN}"
}

QTD_PARAMS=$#

validateParams() {
ERROR=true

if [ $QTD_PARAMS -ne 1 ]; then
    print $COLOR_RED"Illegal number of parameters"
else
    ERROR=false
fi
    [ $ERROR == true ] && example && exit 1
}

validateParams

docker-compose exec php composer create-project $1 .