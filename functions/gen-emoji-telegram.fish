which magick --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function gen-emoji-telegram --wraps=magick
        log-t "Creating" "Telegram" "directory..."
        command mkdir --parents "Telegram"
        log-t "Processing" "$argv[1]" "..."
        command magick -background none "$argv[1]" -resize "100x100^" -gravity center -extent 100x100 $argv[2..-1] "Telegram/$argv[1]"
        log-s "Done! Emojis added to the" "Telegram" "directory!"
    end
end
