which tree --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function tree --wraps="tree -C"
		command tree -C $argv
	end
end
