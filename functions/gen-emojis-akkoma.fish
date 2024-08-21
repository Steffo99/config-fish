which magick --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function gen-emojis-akkoma
        for arg in $argv
            log-i "Processing" "$arg" "..."
            gen-emoji-akkoma "$arg"
        end
        log-s "All emojis generated successfully!"
    end
end
