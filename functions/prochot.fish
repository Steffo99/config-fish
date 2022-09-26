function prochot
    if not fish_is_root_user
        echo_error "This script must be ran as root."
    end

    set_color yellow
    echo "Disabling BD_PROCHOT..."

    set -g reg (rdmsr 0x1FC)

    echo_progress "CPU register reads: "
    echo_highlight "$reg"
    echo

    set -g nval (math -b hex "bitand(0x$reg, 0xFFFFFFFE)")

    echo_progress "New value should be: "
    echo_highlight "$nval"
    echo 

    echo_progress "Writing to the CPU register..."
    echo

    wrmsr 0x1FC $nval

    echo_progress "Turned off BD_PROCHOT!"
end
