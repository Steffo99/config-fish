function __gen-repo-media_is_at_arg
	set args (commandline --current-process --cut-at-cursor --tokenize)
	set len (count $args)
	if [ "$len" -ne "$argv[1]" ]
		return 1
	end
end

function __gen-repo-media_complete_icons
	set org (commandline --current-process --cut-at-cursor --tokenize)[2]
	set files (find "$HOME/Pictures/Avatars/$org/emblems-512x512/solid" -mindepth '1' -maxdepth '1' -type 'f' -iname '*.svg' -printf '%P\n')
	for file in $files
		string replace --regex '[.]svg$' "" "$file"
	end
end

complete \
	--command='gen-repo-media' \
	--no-files \
	--condition='__gen-repo-media_is_at_arg 1' \
	--arguments='(find "$HOME/Pictures/Avatars" -mindepth 1 -maxdepth 1 -type d -printf "%P\n")'

complete \
	--command='gen-repo-media' \
	--no-files \
	--condition='__gen-repo-media_is_at_arg 2' \
	--arguments='(__gen-repo-media_complete_icons)'
