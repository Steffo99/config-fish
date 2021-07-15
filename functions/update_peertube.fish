function update_peertube
    set -g PEERTUBE_USER "$argv[1]"
    if test -z PEERTUBE_USER
        echo_error "Missing argument 1: PEERTUBE_USER" \n
        return 1
    else
        echo_progress "Peertube user is: "
        echo_highlight "$PEERTUBE_USER" \n
    end

    set -g INSTALL_DIR "$argv[2]"
    if test -z INSTALL_DIR
        echo_error "Missing argument 2: INSTALL_DIR" \n
        return 1
    else
        echo_progress "Install dir is: "
        echo_highlight "$INSTALL_DIR" \n
    end

    set -g BACKUP_DIR "$INSTALL_DIR/backup"
    set -g BACKUP_PATH "$BACKUP_DIR/sql-peertube_prod-"(date -Im)".bak"
    echo_progress "Backup path will be: "
    echo_highlight "$BACKUP_PATH" \n

    set -g LATEST (curl -s https://api.github.com/repos/chocobozzz/peertube/releases/latest | grep tag_name | cut -d '"' -f 4) 
    echo_progress "Updating to Peertube "
    echo_highlight "$LATEST" \n

    confirm

    echo_progress "Creating backup dir..." \n
    mkdir -p "$BACKUP_DIR"

    echo_progress "Dumping the database to the backup dir..."
    pg_dump -F custom "peertube_prod" > "$BACKUP_PATH"

    set -g VERSIONS_DIR "$INSTALL_DIR/versions"
    echo_progress "Versions dir is: "
    echo_highlight "$VERSIONS_DIR" \n

    echo_progress "Downloading $LATEST from GitHub Releases..." \n
    wget -q "https://github.com/Chocobozzz/PeerTube/releases/download/$LATEST/peertube-$LATEST.zip" -O "$VERSIONS_DIR/peertube-$LATEST.zip"
    echo_progress "Unzipping..." \n
    unzip -d "$VERSIONS_DIR" "$VERSIONS_DIR/peertube-$LATEST.zip"

    set -g LATEST_DIR "$VERSIONS_DIR/peertube-$LATEST"
    echo_progress "Version $LATEST dir is: "
    echo_highlight "$LATEST_DIR" \n

    echo_progress "Giving back all permissions to: $PEERTUBE_USER" \n
    chmod -R "$PEERTUBE_USER:" "$INSTALL_DIR"

    echo_progress "Updating node dependencies..." \n
    sudo -i -u $PEERTUBE_USER yarn --cwd "$LATEST_DIR" install --production --pure-lockfile

    echo_progress "Ignoring configuration file update, it never changes anyways" \n
    echo_progress "You can see the new one at: "
    echo_highlight "$LATEST_DIR/config/default.yaml"

    echo_progress "Ignoring nginx virtualhost update, we are using apache httpd" \n
    echo_progress "You can see the new one at: "
    echo_highlight "$LATEST_DIR/support/nginx/peertube"

    echo_progress "Ignoring systemd unit file update, it never changes anyways" \n
    echo_progress "You can see the new one at: "
    echo_highlight "$LATEST_DIR/support/systemd/peertube.service"

    echo_progress "Updating peertube-latest symlink..."
    unlink "$INSTALL_DIR/peertube-latest"
    ln -s "$LATEST_DIR" "$INSTALL_DIR/peertube-latest"

    echo_progress "Update complete!"
end