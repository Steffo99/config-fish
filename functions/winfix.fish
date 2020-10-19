function winfix
    sudo umount /dev/sda2
    sudo ntfsfix -d /dev/sda2
    sudo mount -a
end
