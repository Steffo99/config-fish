which magick --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function gen-emoji-discord --wraps=magick
        log-d "Generating emojis for" "Discord (128x128)" "..."
        log-t "Creating" "Discord" "directory..."
        command mkdir --parents "Discord"
        log-t "Processing" "$argv[1]" "..."
        command magick -background none "$argv[1]" -resize "128x128^" -gravity center -extent 128x128 $argv[2..-1] "Discord/$argv[1]"
        log-s "Done! Emojis added to the" "Discord" "directory!"
    end
end
