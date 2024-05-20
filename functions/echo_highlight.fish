function echo_highlight --wraps="echo"
    set_color yellow
    echo -n $argv
    set_color normal
end