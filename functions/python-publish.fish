which uvx --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function python-publish
		uvx twine upload --verbose --config-file ~"/.pypirc" --username Steffo dist/*
	end
end
