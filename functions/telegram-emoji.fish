function telegram-emoji --wraps="magick"
    echo_progress "Processing "
    echo_highlight "$argv[1]"
    echo_progress "..."
    echo
    magick -background none "$argv[1]" -resize "100x100^" -gravity center -extent 100x100 $argv[2..-1] "$argv[1].telegram-emoji.png"
end
