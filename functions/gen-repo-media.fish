function gen-repo-media
	log-i "Generating" ".media" "directory for this repository..."

	set org $argv[1]

	if [ -z "$org" ]
		log-f "Missing" "org" "parameter (#1)."
		exit 1
	else
		log-d "Using organization:" "$org"
	end

	set icon $argv[2]

	if [ -z "$icon" ]
		log-f "Missing" "icon" "parameter (#2)."
		exit 1
	else
		log-d "Using icon:" "$org"
	end

	set emblem_svg "$HOME/Pictures/Avatars/$org/emblems-512x512/solid/$icon.svg"

	if [ ! -f "$emblem_svg" ]
		log-f "Emblem SVG at" "$emblem_svg" "does not exist."
		exit 2
	else
		log-d "Using emblem SVG:" "$emblem_svg"
	end

	set emblem_512x512 "$HOME/Pictures/Avatars/$org/emblems-512x512/solid/$icon.png"

	if [ ! -f "$emblem_512x512" ]
		log-f "Emblem 512x512 at" "$emblem_512x512" "does not exist."
		exit 2
	else
		log-d "Using emblem 512x512:" "$emblem_512x512"
	end

	set emblem_128x128_round "$HOME/Pictures/Avatars/$org/emblems-128x128_round/solid/$icon.png"

	if [ ! -f "$emblem_128x128_round" ]
		log-f "Round emblem 128x128 at" "$emblem_128x128_round" "does not exist."
		exit 2
	else
		log-d "Using round emblem 128x128:" "$emblem_128x128_round"
	end

	log-t "Creating" ".media" "directory..."
	command mkdir .media

	log-t "Copying" "emblem SVG" "..."
	command cp "$emblem_svg" ".media/icon.svg"

	log-t "Copying" "emblem 512x512" "..."
	command cp "$emblem_512x512" ".media/icon-512x512.png"

	log-t "Copying" "round emblem 128x128" "..."
	command cp "$emblem_128x128_round" ".media/icon-128x128_round.svg"

	log-s "Successfully set up" "repository media" "!"
end
