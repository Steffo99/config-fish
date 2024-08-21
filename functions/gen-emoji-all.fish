which magick --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function gen-emoji-all
        log-i "Generating emojis for" "all platforms" "..."
        gen-emoji-akkoma $argv
        gen-emoji-discord $argv
        gen-emoji-telegram $argv
        log-s "Emojis generated for" "all platforms" "successfully!"
    end
end
