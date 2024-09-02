function log-d
	if [ $DOTFISH_LOG_LEVEL -lt 50 ]
		return
	end

	set_color blue
	echo -n -- "$argv[1] "
	set_color reset

	set_color --bold brblue
	echo -n -- "$argv[2]"
	set_color reset

	set_color blue
	echo -n -- " $argv[3]"
	echo
	set_color reset
end
