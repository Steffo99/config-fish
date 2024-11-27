function log-e
	if [ $DOTFISH_LOG_LEVEL -lt 10 ]
		return
	end

	set_color red
	echo -n -- "$argv[1] " 1>&2
	set_color reset

	set_color --bold brred
	echo -n -- "$argv[2]" 1>&2
	set_color reset

	set_color red
	echo -n -- " $argv[3]" 1>&2
	echo
	set_color reset
end
