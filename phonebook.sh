#!/usr/bin/env bash

echo -e "==========\nWELCOME TO METADATA STORER 3000\or phonebook i guess\n=========="
while true
do
	echo -e "\n==========\nWhat would you like to do?\n(Press h to show options.)"

read -p 'Action: ' userAction

if [ "$userAction" = "h" ]; then
	echo -e "\nOptions are as follows: \nAdd entry (a)\nSearch for entry (s)\nList all entries (l)\nCount entries (ce)\nClear screen (cs)\nClear phonebook (c)\nQuit (q). \n\nPlease enter the letter that corresponds to your choice."

elif [ "$userAction" = "a" ]; then
	read -p 'Filename/Personname: ' name
	read -p 'Notes/Phone number: ' notes
	echo "$name - $notes" >> ./.phonebook
	sort -o ./.phonebook ./.phonebook
	echo -e "\nAdded to METADATA STORER 3000."

elif [ "$userAction" = "s" ]; then
	read -p 'Query: ' query
	cat ./.phonebook | grep "$query" | cat

elif [ "$userAction" = "l" ]; then
	cat ./.phonebook

elif [ "$userAction" = "ce" ]; then
	echo -e "\nTotal entries: " && cat ./.phonebook | wc -l

elif [ "$userAction" = "cs" ]; then
	clear

elif [ "$userAction" = "c" ]; then
	read -p 'This action will delete every entry in your phonebook. It is irreversable. Are you sure? (y/n): ' userChoice
		if [ "$userChoice" = "y" ]; then
			echo -e "" > ./.phonebook
			echo -e "\nMETADATA STORER 3000 cleared"
		elif [ "$userChoice" = "n" ]; then
			echo -e "\nWill not clear METADATA STORER 3000."
		else
			echo -e "\nENTER VALID OPTION"
		fi
elif [ "$userAction" = "q" ]; then
	break
else
	echo -e "\nENTER VALID OPTION"
fi
done
echo -e "\nDONE"
