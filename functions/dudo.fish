which sudo --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function dudo --wraps="sudo"
		command sudo $argv
	end
end
