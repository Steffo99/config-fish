function dotfish
	log-i "Running" "dotfish" "update..."

	if test (count $argv) -eq 0 
		set -g argv (whoami)
		log-d "No users specified, running on" "$argv" ""
	end

	for TARGET in $argv
		log-d "Updating fish config for:" "$TARGET" ""

		set -g FISHCONFIG ~(echo $TARGET)/.config/fish

		log-t "Destination directory is:" "$FISHCONFIG" ""
		if not test -e "$FISHCONFIG/.DOTFISHED"
			log-w "Conflicting config detected" "$FISHCONFIG" ", delete?"
			if confirm
				log-t "Deleting old config at" "$FISHCONFIG" "..."
				command rm -rf "$FISHCONFIG"
			else
				log-t "Deletion rejected, not touching" "$FISHCONFIG" "."
				continue
			end
		end

		log-t "Fixing permissions at" "$FISHCONFIG" "..."
		command chown -R "$TARGET:" "$FISHCONFIG"

		if test -d "$FISHCONFIG"
			log-t "Existing config detected at" "$FISHCONFIG" "pulling from Git..."
			command sudo -u "$TARGET" -- git -C "$FISHCONFIG" pull
		else
			log-t "No config detected, cloning from Git into" "$FISHCONFIG" "..."
			command sudo -u "$TARGET" -- git clone "https://github.com/Steffo99/.config-fish" "$FISHCONFIG"
		end

		log-t "Changing login shell to" "/usr/bin/fish" "..."
		command chsh -s "/usr/bin/fish" "$TARGET"
	end

	log-s "Dotfish updated successfully for" "$argv" "!"
end