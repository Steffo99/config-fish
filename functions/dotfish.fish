function dotfish
    if test (count $argv) -ge 1
        set -g TARGET $argv[1]
    else
        set -g TARGET (whoami)
    end
    
    echo_progress "Updating fish config for: "
    echo_highlight "$TARGET" \n

    if test -z $TARGET
        echo_progress "Invalid target, exiting with 1"
        exit 1
    end

    set -g FISHCONFIG ~(echo $TARGET)/.config/fish

    echo_progress "Destination directory is: "
    echo_highlight "$FISHCONFIG" \n

    if test -d $FISHCONFIG
        echo_progress "Pulling from Git..." \n
        git -C $FISHCONFIG pull
    else
        echo_progress "Cloning from Git..." \n
        git clone "https://github.com/Steffo99/.config-fish" $FISHCONFIG
    end

    echo_progress "Fixing permissions..." \n
    chown -R "$TARGET:" $FISHCONFIG

    echo_progress "Update complete!"
end