function discord_export
    if test -z "$DISCORD_TOKEN_BOT"
        echo_error "\$DISCORD_TOKEN_BOT is not set."
        exit 1
    end

    discord-chat-exporter-cli export -c" $argv"
end