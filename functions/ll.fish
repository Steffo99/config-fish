function ll --wraps="ls"
    ls --all --author --color --kibibytes --human-readable -l $argv;
end
