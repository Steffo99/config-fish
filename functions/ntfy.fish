which curl --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function ntfy
		argparse --name='ntfy' --min-args=1 \
			(fish_opt --short="d" --long="topic" --required-val) \
			(fish_opt --short="t" --long="title" --optional-val) \
			(fish_opt --short="p" --long="priority" --optional-val) \
			(fish_opt --short="x" --long="tag" --multiple-vals) \
			(fish_opt --short="m" --long="markdown") \
			-- $argv

		if [ $status -ne 0 ]
			log-f "Invalid" "syntax" "."
			return 1
		end

		log-t "Token is:" "$NTFY_TOKEN"
		log-t "Topic is:" "$_flag_topic"
		log-t "Title is:" "$_flag_title"
		log-t "Priority is:" "$_flag_priority"
		log-t "Tags are:" "$_flag_tag"
		log-t "Markdown is:" "$_flag_markdown"
		log-t "Message is:" "$argv"

		if [ -z "$_flag_topic" ]
			if [ -z "$hostname" ]
				log-d "Missing" "topic and hostname" ", defaulting to 'general'."
				set _flag_topic "general"
			else
				log-d "Missing" "topic" ", defaulting to 'host_$hostname'."
				set _flag_topic "host_$hostname"
			end
		end

		if [ -z "$_flag_priority" ]
			log-d "Missing" "priority" ", defaulting to 'default'."
			set _flag_priority "default"
		end

		if [ -n "$_flag_title" ]
			set header_title "X-Title: $_flag_title"
			log-t "Created header:" "$header_title"
		end

		if [ -n "$_flag_priority" ]
			set header_priority "X-Priority: $_flag_priority"
			log-t "Created header:" "$header_priority"
		end

		if [ -n "$_flag_tag" ]
			set header_tags "X-Tags: $_flag_tag"
			log-t "Created header:" "$header_tags"
		end

		if [ -n "$_flag_markdown" ]
			set header_markdown "X-Markdown: 1"
			log-t "Created header:" "$header_markdown"
		end

		log-i "Sending $_flag_priority notification to" "$_flag_topic" " with tags [$_flag_tag]..."

		set curl_response \
			(curl "https://ntfy.steffo.eu/$_flag_topic" \
				--header "Authorization: Bearer $NTFY_TOKEN" \
				--header "$header_title" \
				--header "$header_priority" \
				--header "$header_tags" \
				--header "$header_markdown" \
				--data "$argv" \
				--silent
			)
		
		set curl_error (echo "$curl_response" | jq --raw-output '.error')

		if [ "$curl_error" != "null" ]
			log-f "Failed to send notification:" "$curl_error"
			return 3
		end

		log-s "Sent notification to" "$_flag_topic" "!"
	end
end
