which ssh-agent --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function ssh-start
        log-t "Starting" "ssh-agent" "..."
        eval (ssh-agent -c)
        log-t "Adding" "private key" "to the agent..."
        ssh-add ~/.ssh/id_ed25519
    end
end