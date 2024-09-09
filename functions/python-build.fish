which uvx --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
	function python-build
		uvx --from build pyproject-build --installer uv
	end
end
