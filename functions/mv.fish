which ls --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function mv --wraps="mv"
		log-t "Performing a" "safe move" "..."
        command mv --interactive --verbose $argv; 
    end
end
