which docker --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function redocker
		set project (docker compose config --format json | jq --raw-output .name)
		log-i "Re-instantiating" "$project" "..." 

		log-t "Pulling images used by " "$project" "..."
		command docker compose pull

		log-t "Building images using by " "$project" "..."
		command docker compose build

		log-t "Taking down " "$project" "..."
		command docker compose down

		log-t "Bringing up " "$project" "..."
		command docker compose up -d

		log-s "Re-instantiated" "$project" "!" 
		
		log-t "Opening logs of " "$project" "..."
		command docker compose logs -f
	end
end
