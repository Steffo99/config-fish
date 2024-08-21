which rm --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function rm --wraps="rm"
        command rm --interactive="always" $argv
    end
end
