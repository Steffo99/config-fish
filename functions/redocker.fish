function redocker
	set project (docker compose config --format json | jq .name)

	echo_progress "Pulling images used by "
	echo_highlight "$project"
	echo_progress "..."
	echo
	docker compose pull

	echo_progress "Building images using by "
	echo_highlight "$project"
	echo_progress "..."
	echo
	docker compose build

	echo_progress "Taking down "
	echo_highlight "$project"
	echo_progress "..."
	echo
	docker compose down

	echo_progress "Bringing up "
	echo_highlight "$project"
	echo_progress "..."
	echo
	docker compose up -d
	
	echo_progress "Opening logs of "
	echo_highlight "$project"
	echo_progress "..."
	echo
	docker compose logs -f
end
