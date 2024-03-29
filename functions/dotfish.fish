function dotfish
    if test (count $argv) -eq 0
        set -g argv (whoami)
    end

    for TARGET in $argv
        echo_progress "Updating fish config for: "
        echo_highlight "$TARGET" \n

        set -g FISHCONFIG ~(echo $TARGET)/.config/fish

        echo_progress "Destination directory is: "
        echo_highlight "$FISHCONFIG" \n

        if not test -e "$FISHCONFIG/.DOTFISHED"
            echo_progress "Conflicting config detected, confirm deletion?" \n
            if confirm
                echo_progress "Deleting old config..." \n 
                rm -rf "$FISHCONFIG"
            else
                echo_progress "Deletion was refused, skipping..." \n
                continue
            end
        end
            

        if test -d "$FISHCONFIG"
            echo_progress "Existing config detected, pulling from Git..." \n
            git -C "$FISHCONFIG" pull
        else
            echo_progress "No config detected, cloning from Git..." \n
            git clone "https://github.com/Steffo99/.config-fish" "$FISHCONFIG"
        end

        echo_progress "Fixing permissions..." \n
        chown -R "$TARGET:" "$FISHCONFIG"

        echo_progress "Changing login shell..." \n
        chsh -s "/usr/bin/fish" "$TARGET"

        echo_progress "Update complete!" \n
    end
end