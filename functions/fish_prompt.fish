function fish_prompt
    set "STATUS" $status
    set 'UID' (id -u)

    if test "$UID" -eq 0
        set_color brred
    else if test "$UID" -lt 1000
        set_color brpurple
    else if test "$UID" -ge 60000
        set_color brcyan
    else
        set_color green
    end
    echo -n "$USER"
    
    set_color normal
    echo -n "@"(prompt_hostname)":"

    if string match "/home/*" "$PWD" >/dev/null
        set_color brblue
    else
        set_color --bold ff7f00
    end
    echo -n (prompt_pwd)

    if test $STATUS -ne 0
        set_color brred
        echo -n "$STATUS "
    else
        set_color normal
        if test "$UID" -eq 0
            echo -n "# "
        else
            echo -n "\$ "
        end
    end
    set_color normal



end
