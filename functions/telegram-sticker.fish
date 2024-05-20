function telegram-sticker
    echo_progress "Processing "
    echo_highlight "$argv[1]"
    echo_progress "..."
    echo
    magick -background none "$argv[1]" -resize 512x512 -gravity center $argv[2..-1] "$argv[1].telegram-sticker.png"
end
