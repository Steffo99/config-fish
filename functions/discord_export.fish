function discord_export
    if test -z "$DISCORD_TOKEN_BOT"
        echo_error "\$DISCORD_TOKEN_BOT is not set."
        exit 1
    end

    set channels "--channel "$argv
    set channels (string split -- " " "$channels")

    echo_progress $channels

    discord-chat-exporter-cli export --bot $channels
end