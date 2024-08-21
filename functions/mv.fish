which ls --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function mv --wraps="mv"
        command mv --interactive --verbose $argv; 
    end
end
