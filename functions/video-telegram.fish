function telegram-video
    ffmpeg -i "$argv[1]" -filter:v 'scale=480:-1' -c:v 'h264_nvenc' -c:a 'copy' -crf '29' "$argv[1].crf29.mp4"
end
