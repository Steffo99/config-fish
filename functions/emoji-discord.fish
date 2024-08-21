which magick --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function emoji-discord --wraps=magick
        log-d "Creating" "Discord" "directory..."
        command mkdir --parents "Discord"
        log-d "Processing" "$argv[1]" "..."
        command magick -background none "$argv[1]" -resize "106x106^" -gravity center -extent 128x128 $argv[2..-1] "Discord/$argv[1]"
        log-s "Done! Emojis added to the " "Discord" "directory!"
    end
end
