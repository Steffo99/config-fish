function log-w
	if [ $DOTFISH_LOG_LEVEL -lt 20 ]
		return
	end

	set_color yellow
	echo -n -- "$argv[1] "
	set_color normal

	set_color --bold bryellow
	echo -n -- "$argv[2]"
	set_color normal

	set_color yellow
	echo -n -- " $argv[3]"
	echo
	set_color reset
end
