which sudo --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function dudo --wraps="sudo"
		log-t "just do as" "superuser" ", bro"
		command sudo $argv
	end
end
