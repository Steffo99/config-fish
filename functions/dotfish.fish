function dotfish
    if test (count $argv) -ge 1
        set -g TARGET $argv[1]
    else
        set -g TARGET (whoami)
    end
    
    echo_progress "Updating fish config for: "
    echo_highlight "$TARGET" \n

    echo_progress "Pulling from Git..." \n
    git -C ~(echo $TARGET)/.config/fish pull

    echo_progress "Fixing permissions..." \n
    chown -R "$TARGET:" ~(echo $TARGET)

    echo_progress "Update complete!"
end