#!/bin/bash

echo "Please enter a URL: "
read URL

URL_VALIDATION_REGEX="^((https?|ftps?):\/\/)?[0-9A-Za-z]+.(com|org|net)$"

if [[ $URL =~ $URL_VALIDATION_REGEX ]] ; then
	echo "Please enter in the number of times this URL should be accessed:"
	read NUM_OF_REQUESTS

	RUNNING_TOTAL=0
	echo "Now accessing" $URL $NUM_OF_REQUESTS "times."
	for (( iteration=1; iteration <= $NUM_OF_REQUESTS; iteration++ ))
	do
		CURRENT_TIME_STRING=$(curl -s -w "%{time_total}\n" $URL -o /dev/null)
		echo "Current Request Time: " $CURRENT_TIME_STRING "s"
		CURRENT_TIME_NUM=$(bc <<< "scale=3;$CURRENT_TIME_STRING")
		RUNNING_TOTAL=$(echo "scale=3;$RUNNING_TOTAL + $CURRENT_TIME_NUM;" | bc)
	done

	MEAN_RUNNING_TIME=$(echo "scale=3;$RUNNING_TOTAL / $NUM_OF_REQUESTS;" | bc)
	echo "Mean Request Time:" $MEAN_RUNNING_TIME "s"
else
	echo "The URL" $URL "is not valid. Goodbye."
fi
