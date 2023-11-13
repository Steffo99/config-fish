function dalle
set base_url "https://api.openai.com"

set response (curl --silent "$base_url/v1/images/generations" -H 'Content-Type: application/json' -H "Authorization: Bearer $OPENAI_API_KEY" -d '{"n": 1, "size": "1024x1024", "prompt":"'$argv[1]'"}')

echo "$response" | jq

set error (echo "$response" | jq '.error')

if test "$error" != "null"
return 1
end

set timestamp (echo "$response" | jq --raw-output '.created')
set image_url (echo "$response" | jq --raw-output '.data[0].url')

set output "/home/steffo/Pictures/DALL·E²/$timestamp - "$argv[1]".png"
wget --quiet --output-document="$output" "$image_url"
open "$output" > /dev/null 2> /dev/null
end
