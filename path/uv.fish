which uv --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    log-t "Adding" "uv" "binaries to the PATH..."
    fish_add_path ~"/.local/bin"
end
