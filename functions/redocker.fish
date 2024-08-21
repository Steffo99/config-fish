which docker --skip-functions >/dev/null 2>/dev/null
	if [ $status -eq 0 ]
	function redocker
		set project (docker compose config --format json | jq --raw-output .name)

		log-d "Pulling images used by " "$project" "..."
		command docker compose pull

		log-d "Building images using by " "$project" "..."
		command docker compose build

		echo_progress "Taking down " "$project" "..."
		command docker compose down

		echo_progress "Bringing up " "$project" "..."
		command docker compose up -d
		
		echo_progress "Opening logs of " "$project" "..."
		command docker compose logs -f
	end
end
