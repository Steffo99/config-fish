function echo_progress --wraps="echo"
    set_color yellow --dim
    echo -n $argv
    set_color normal
end