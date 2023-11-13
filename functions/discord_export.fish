function discord_export
    if test -z "$DISCORD_TOKEN"
        echo_error "\$DISCORD_TOKEN is not set."
	return
    end

    set channels "--channel "$argv
    set channels (string split -- " " "$channels")

    discord-chat-exporter-cli export --bot --token $DISCORD_TOKEN $channels
end
