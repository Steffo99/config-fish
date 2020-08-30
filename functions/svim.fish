function svim --wraps='sudo -u (stat -c "%U" $1) vim $1' --description 'alias svim sudo -u (stat -c "%U" $1) vim $1'
    set -l owner (stat -c "%U" $argv[1])
    echo "File owner: $owner"
    sudo -u $owner vim $argv
end
