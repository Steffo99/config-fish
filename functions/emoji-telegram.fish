which magick --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function emoji-telegram --wraps=magick
        log-t "Creating" "Telegram" "directory..."
        command mkdir --parents "Telegram"
        log-t "Processing" "$argv[1]" "..."
        command magick -background none "$argv[1]" -resize "100x100^" -gravity center -extent 128x128 $argv[2..-1] "Telegram/$argv[1]"
        log-s "Done! Emojis added to the " "Telegram" "directory!"
    end
end
