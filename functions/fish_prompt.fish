function fish_prompt
    # Save variables before they are gone
    set "DOTFISH_STATUS" $status
    set "DOTFISH_UID" (id -u)


    # User name
    switch ~
    case "/root"
        # Root
        set_color brred
    case "/home/*"
        # Regular user
        set_color brgreen
    case "*"
        # Temporary account
        set_color brpurple
    end
    echo -n "$USER"


    # Jobs
    set "JOBSCOUNT" (jobs | count)
    if test $JOBSCOUNT -ge 1
        set_color brmagenta
        echo -n "&$JOBSCOUNT"
    end
    

    # @
    set_color normal
    echo -n "@"


    # Hostname
    if test -n "$SSH_CLIENT"
        set_color cyan
    else if test -n "$SUDO_COMMAND"
        set_color purple
    else
        set_color green
    end

    echo -n (prompt_hostname)


    # :
    set_color normal
    echo -n ":"


    # Current working directory
    if not test -e "$PWD"
        set_color brblack
    else if not test -x .
        set_color white
    else if not test -r .
        set_color white
    else if not test -w .
        set_color yellow
    else
        set_color brblue
    end
    echo -n (prompt_pwd)


    # Exit status
    if test $DOTFISH_STATUS -ne 0
        set_color brred
        echo -n "[$DOTFISH_STATUS]"
    end
    set_color normal


    # Dollar
    set_color --bold white
    if test "$DOTFISH_UID" -eq 0
        echo -n "# "
    else
        echo -n "\$ "
    end
    set_color normal
end
