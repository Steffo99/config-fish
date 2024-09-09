which magick --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function pad-image
		log-t "Creating" "Images padded to $argv[1]" "directory..."
		command mkdir --parents "Images padded to $argv[1]"
		log-d "Padding" "$argv[3]" "to $argv[1]..."
		command magick -background "$argv[2]" "$argv[3]" -resize "$argv[1]" -gravity "center" -extent "$argv[1]" $argv[4..-1] "Images padded to $argv[1]/$argv[3]"
		log-t "Done! Emoji added to the" "Images padded to $argv[1]" "directory!"
	end
end
