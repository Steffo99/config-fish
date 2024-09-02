function work-on --wraps="cd /mnt/work/steffo"
    set --global DOTFISH_WORKSPACE $argv[1]
    cd "/mnt/work/steffo/$DOTFISH_WORKSPACE" $argv[2..-1]
end
