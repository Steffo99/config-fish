function regex_mv

    echo_progress "Find: "
    echo_highlight "$argv[1]"
    echo

    echo_progress "Replace with: "
    echo_highlight "$argv[2]"
    echo

    echo

    for old in (ls)
        set new (echo $old | sed -r "s/$argv[1]/$argv[2]/g")
        echo_progress "$old → "
        echo_highlight "$new"
        echo
    end

    if not confirm
        return 1
    end

    for old in (ls)
        set new (echo $old | sed -r "s/$argv[1]/$argv[2]/g")
        mv "$old" "$new"
    end

end
