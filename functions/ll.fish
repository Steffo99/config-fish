which ls --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function ll --wraps=ls
		log-t "" "Listing" "all files in the directory..."
        command ls --all --author --color --kibibytes --human-readable --group-directories-first -l $argv;
    end
end
