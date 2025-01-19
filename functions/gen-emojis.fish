which magick --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function gen-emojis
        for arg in $argv
            log-i "Processing" "$arg" "..."

            for arg in $argv
                log-i "Processing" "$arg" "..."
                gen-emoji-akkoma "$arg"
            end
            log-s "All emojis generated successfully!"

            for arg in $argv
                log-i "Processing" "$arg" "..."
                gen-emoji-discord "$arg"
            end
            log-s "All emojis generated successfully!"

            for arg in $argv
                log-i "Processing" "$arg" "..."
                gen-emoji-telegram "$arg"
            end
            log-s "All emojis generated successfully!"
        end
        log-s "All emojis generated successfully!"
    end
end
