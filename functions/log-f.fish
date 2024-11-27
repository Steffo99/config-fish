function log-f
	if [ $DOTFISH_LOG_LEVEL -lt 0 ]
		return
	end

	set_color --background red
	set_color brwhite
	echo -n -- "$argv[1] " 1>&2
	set_color reset

	set_color --background brred
	set_color --bold brwhite
	echo -n -- "$argv[2]" 1>&2
	set_color reset

	set_color --background red
	set_color brwhite
	echo -n -- " $argv[3]" 1>&2
	echo
	set_color reset
end
