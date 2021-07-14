function svim --wraps='sudo -u (stat -c "%U" $1) vim $1' --description 'alias svim sudo -u (stat -c "%U" $1) vim $1'
    set -l owner (stat -c "%U" $argv[1])
    set_color white
    echo -n "File owner: "
    set_color --bold brwhite
    echo $owner
    set_color normal
    sudo -u $owner vim $argv
end
