which magick --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function emoji-akkoma --wraps=magick
        log-t "Creating" "Akkoma" "directory..."
        command mkdir --parents "Akkoma"
        log-t "Processing" "$argv[1]" "..."
        command magick -background none "$argv[1]" -resize "106x106^" -gravity center -extent 106x106 $argv[2..-1] "Akkoma/$argv[1]"
        log-s "Done! Emojis added to the " "Akkoma" "directory!"
    end
end
