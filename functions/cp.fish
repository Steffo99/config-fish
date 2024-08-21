which cp --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function cp --wraps="cp"
		log-t "Performing a" "safe copy" "..."
		command cp --interactive --verbose $argv; 
	end
end
