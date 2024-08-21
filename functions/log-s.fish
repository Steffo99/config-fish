function log-s
	if [ $DOTFISH_LOG_LEVEL -lt 30 ]
		return
	end

	set_color green
	echo -n -- "$argv[1] "
	set_color normal

	set_color --bold brgreen
	echo -n -- "$argv[2]"
	set_color normal

	set_color green
	echo -n -- " $argv[3]"
	echo
	set_color reset
end
