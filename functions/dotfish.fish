function dotfish
    if test (count $argv) -eq 0
        set -g argv (whoami)
    end

    for TARGET in $argv
        log-d "Updating fish config for:" "$TARGET" ""
        set -g FISHCONFIG ~(echo $TARGET)/.config/fish

        log-d "Destination directory is:" "$FISHCONFIG" ""
        if not test -e "$FISHCONFIG/.DOTFISHED"
            log-w "Conflicting config detected" "$FISHCONFIG" ", delete?"
            if confirm
                log-d "Deleting old config at" "$FISHCONFIG" "..."
                command rm -rf "$FISHCONFIG"
            else
                log-d "Deletion rejected, not touching" "$FISHCONFIG" "..."
                continue
            end
        end            

        if test -d "$FISHCONFIG"
            log-d "Existing config detected at" "$FISHCONFIG" "pulling from Git..."
            command git -C "$FISHCONFIG" pull
        else
            log-d "No config detected, cloning from Git into" "$FISHCONFIG" "..."
            command git clone "https://github.com/Steffo99/.config-fish" "$FISHCONFIG"
        end

        log-d "Fixing permissions at" "$FISHCONFIG" "..."
        command chown -R "$TARGET:" "$FISHCONFIG"

        log-d "Changing login shell to" "/usr/bin/fish" "..."
        command chsh -s "/usr/bin/fish" "$TARGET"

        log-s "" "Dotfish" "updated successfully!"
    end
end