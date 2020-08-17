function osu-latency-fix
    pactl unload-module 7
    pactl load-module module-alsa-card device_id=1 name=usb-0d8c_USB_Sound_Device-00-Device card_name=alsa_card.usb-0d8c_USB_Sound_Device-00-Device namereg_fail=false tsched=no fixed_latency_range=yes ignore_dB=no deferred_volume=yes use_ucm=yes card_properties="module-udev-detect.discovered=1" fragments=1 fragment_size=15
end
