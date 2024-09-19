which ntfy --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function ntfy
		set topic $argv[1]
		set data $argv[2..-1]

		log-t "Sending notification to" "$topic" "..."

		curl \
			"https://ntfy.steffo.eu/$topic" \
			--header "Authorization: Bearer $NTFY_TOKEN" \
			--data "$data"
	end
end
