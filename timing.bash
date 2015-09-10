echo "Please enter a URL: "
read URL

echo "Please enter in the number of times this URL should be accessed:"
read NUM_OF_ACCESSES

REGEX="([0-9]{1,3}\.[0-9]{3})"
RUNNING_TOTAL=0


echo "Now accessing " $URL $NUM_OF_ACCESSES " times."
for (( iteration=1; iteration <= $NUM_OF_ACCESSES; iteration++))
do
	CURRENT_TIME=$(curl -s -w "%{time_total}\n" $URL -o /dev/null)
	echo "Current Request Time: " $CURRENT_TIME "s"
	#RUNNING_TOTAL=$((RUNNING_TOTAL+=CURRENT_TIME))
done

echo $RUNNING_TOTAL
