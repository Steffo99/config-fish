function resolvify
    ffmpeg -i "$argv[1]" -vcodec dnxhd -b:v 36M -acodec pcm_s16le -f mov "$argv[1].dnxhd.mov"
end
