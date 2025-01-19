complete \
	--command='ntfy' \
	--short-option="d" \
	--long-option="topic" \
	--description="Set topic"

complete \
	--command='ntfy' \
	--short-option="t" \
	--long-option="title" \
	--description="Set title"

function __ntfy_complete_priorities
	echo max \t 'Really long vibration bursts, default notification sound with a pop-over notification.'
	echo high \t 'Long vibration burst, default notification sound with a pop-over notification.'
	echo default \t 'Short default vibration and sound. Default notification behavior.'
	echo low \t 'No vibration or sound. Notification will not visibly show up until notification drawer is pulled down.'
	echo min \t 'No vibration or sound. The notification will be under the fold in Other notifications.'
end

complete \
	--command='ntfy' \
	--short-option="p" \
	--long-option="priority" \
	--description="Set priority" \
	--no-files \
	--arguments='(__ntfy_complete_priorities)'

complete \
	--command='ntfy' \
	--short-option="x" \
	--long-option="tag" \
	--description="Add tag"

complete \
	--command='ntfy' \
	--short-option="m" \
	--long-option="markdown" \
	--description="Use Markdown"
