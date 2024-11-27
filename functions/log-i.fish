function log-i
	if [ $DOTFISH_LOG_LEVEL -lt 40 ]
		return
	end

	set_color cyan
	echo -n -- "$argv[1] " 1>&2
	set_color reset

	set_color --bold brcyan
	echo -n -- "$argv[2]" 1>&2
	set_color reset

	set_color cyan
	echo -n -- " $argv[3]" 1>&2
	echo
	set_color reset
end
