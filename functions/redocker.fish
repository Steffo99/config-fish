which docker --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function redocker
		set project (docker compose config --format json | jq --raw-output .name)
		if [ -z $project ]
			set pwd (pwd)
			log-f "No compose project found in the current directory:" "$pwd"
			return 1
		end

		log-i "Re-instantiating" "$project" "..." 

		log-t "Pulling images used by " "$project" "..."
		command docker compose pull; or return 1

		log-t "Building images using by " "$project" "..."
		command docker compose build; or return 1

		log-t "Taking down " "$project" "..."
		command docker compose down; or return 1

		log-t "Bringing up " "$project" "..."
		command docker compose up -d; or return 1

		log-s "Re-instantiated" "$project" "!" 
		
		log-t "Opening logs of " "$project" "..."
		command docker compose logs -f; or return 1
	end
end
