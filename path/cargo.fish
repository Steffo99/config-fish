which cargo --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    log-t "Adding" "cargo" "binaries to the PATH..."
    fish_add_path ~"/.cargo/bin"
end