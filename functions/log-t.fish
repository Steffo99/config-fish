function log-t
	if [ $DOTFISH_LOG_LEVEL -lt 60 ]
		return
	end

	set_color purple
	echo -n -- "$argv[1] "
	set_color normal

	set_color --bold brpurple
	echo -n -- "$argv[2]"
	set_color normal

	set_color purple
	echo -n -- " $argv[3]"
	echo
	set_color reset
end
