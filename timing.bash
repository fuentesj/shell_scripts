echo "Please enter a URL: "
read URL

echo "Please enter in the number of times this URL should be accessed:"
read NUM_OF_ACCESSES


echo "Now accessing " $URL $NUM_OF_ACCESSES " times."
for (( iteration=1; iteration <= $NUM_OF_ACCESSES; iteration++))
do
	{ time curl $URL  > /dev/null; } |& grep real
done
