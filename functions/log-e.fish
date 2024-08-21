function log-e
	if [ $DOTFISH_LOG_LEVEL -lt 10 ]
		return
	end

	set_color red
	echo -n -- "$argv[1] "
	set_color normal

	set_color --bold brred
	echo -n -- "$argv[2]"
	set_color normal

	set_color red
	echo -n -- " $argv[3]"
	echo
	set_color normal
end
