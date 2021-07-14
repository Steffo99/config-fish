function fish_prompt
    # Save variables before they are gone
    set "STATUS" $status
    set "UID" (id -u)


    # User name
    if test "$UID" -eq 0
        # Root
        set_color brred
    else if test "$UID" -lt 1000
        # System account
        set_color brpurple
    else if test "$UID" -ge 60000
        # Temporary account
        set_color brcyan
    else
        # Regular user
        set_color brgreen
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
    if test -z $SSH_CLIENT
        set_color green
    else 
        set_color cyan
    end
    echo -n (prompt_hostname)


    # :
    set_color normal
    echo -n ":"


    # Current working directory
    if not test -x .
        set_color brblack
    else if not test -r .
        set_color white
    else if not test -w .
        set_color yellow
    else
        set_color brblue
    end
    echo -n (prompt_pwd)


    # Exit status
    if test $STATUS -ne 0
        set_color brred
        echo -n "[$STATUS]"
    end
    set_color normal


    # Dollar
    set_color --bold white
    if test "$UID" -eq 0
        echo -n "# "
    else
        echo -n "\$ "
    end
    set_color normal
end
