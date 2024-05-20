function echo_error --wraps="echo"
    set_color brred --bold
    echo -n $argv
    set_color normal
end