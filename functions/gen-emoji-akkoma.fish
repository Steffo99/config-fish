which magick --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function gen-emoji-akkoma --wraps=magick
        log-t "Creating" "Akkoma" "directory..."
        command mkdir --parents "Akkoma"
        log-d "Processing" "$argv[1]" "for Akkoma use..."
        command magick -background none "$argv[1]"'[106x106]' -gravity 'center' -extent '106x106' $argv[2..-1] "Akkoma/$argv[1].png"
        log-t "Done! Emoji added to the" "Akkoma" "directory!"
    end
end
