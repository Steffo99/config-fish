which docker --skip-functions >/dev/null 2>/dev/null
if [ $status -eq 0 ]
    function video-telegram
        log-t "Converting" "$argv[1]" "to chat optimized format..."
        ffmpeg -i "$argv[1]" -filter:v 'scale=480:-1' -c:v 'h264_nvenc' -c:a 'copy' -crf '29' "$argv[1].crf29.mp4"
    end
end
