which ls --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function ll --wraps=ls
        command ls --all --author --color --kibibytes --human-readable -l $argv;
    end
end
