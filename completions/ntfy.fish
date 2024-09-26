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

complete \
	--command='ntfy' \
	--short-option="p" \
	--long-option="priority" \
	--description="Set priority" \ 
	--arguments='urgent high default low min'

complete \
	--command='ntfy' \
	--short-option="x" \
	--long-option="tag" \
	--description="Add tag"
