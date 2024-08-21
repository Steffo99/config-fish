which clear --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function cls --wraps="clear"
		command clear $argv
	end
end
