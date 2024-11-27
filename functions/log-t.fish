function log-t
	if [ $DOTFISH_LOG_LEVEL -lt 60 ]
		return
	end

	set_color purple
	echo -n -- "$argv[1] " 1>&2
	set_color reset

	set_color --bold brpurple
	echo -n -- "$argv[2]" 1>&2
	set_color reset

	set_color purple
	echo -n -- " $argv[3]" 1>&2
	echo
	set_color reset
end
