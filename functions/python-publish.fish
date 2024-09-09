which uvx --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function python-publish
		uvx twine upload --non-interactive --verbose --username "Steffo" dist/*
	end
end
