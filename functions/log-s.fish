function log-s
	if [ $DOTFISH_LOG_LEVEL -lt 30 ]
		return
	end

	set_color green
	echo -n -- "$argv[1] " 1>&2
	set_color reset

	set_color --bold brgreen
	echo -n -- "$argv[2]" 1>&2
	set_color reset

	set_color green
	echo -n -- " $argv[3]" 1>&2
	echo
	set_color reset
end
