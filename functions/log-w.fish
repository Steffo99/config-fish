function log-w
	if [ $DOTFISH_LOG_LEVEL -lt 20 ]
		return
	end

	set_color yellow
	echo -n -- "$argv[1] " 1>&2
	set_color reset

	set_color --bold bryellow
	echo -n -- "$argv[2]" 1>&2
	set_color reset

	set_color yellow
	echo -n -- " $argv[3]" 1>&2
	echo
	set_color reset
end
