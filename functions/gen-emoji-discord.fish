which magick --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function gen-emoji-discord --wraps=magick
        log-t "Creating" "Discord" "directory..."
        command mkdir --parents "Discord"
        log-d "Processing" "$argv[1]" "for Discord use..."
        command magick -background none "$argv[1]"'[128x128]' -gravity 'center' -extent '128x128' $argv[2..-1] "Discord/$argv[1]"
        log-t "Done! Emoji added to the" "Discord" "directory!"
    end
end
