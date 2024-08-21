function confirm
	log-t "Asking for a" "confirmation" "..."
	set -g ANSWER (read -n 1 -P "Confirm? (y/N) ")

	if test -z $ANSWER
		return 1
	else if test $ANSWER = "y"
		return 0
	else if test $ANSWER = "Y"
		return 0
	else
		return 1
	end
end