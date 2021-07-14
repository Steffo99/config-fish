function winfix
    sudo umount /dev/sdc2
    sudo ntfsfix -d /dev/sdc2
    sudo mount -a
end
