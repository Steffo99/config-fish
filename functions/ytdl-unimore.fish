# Defined in - @ line 1
function ytdl-unimore --wraps='youtube-dl --cookies ~/.cookies.Unimore.txt' --description 'alias ytdl-unimore youtube-dl --cookies ~/.cookies.Unimore.txt'
  youtube-dl --cookies ~/.cookies.Unimore.txt $argv;
end
