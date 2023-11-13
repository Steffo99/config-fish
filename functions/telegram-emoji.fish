function telegram-emoji
	magick -background none "$argv[1]" -resize "100x100^" -gravity "center" -extent "100x100" "$argv[1].telegram-emoji.png"
end
