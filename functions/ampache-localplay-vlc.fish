# Defined in - @ line 1
function ampache-localplay-vlc --wraps='vlc -I qt --extraintf http --http-port 40000' --description 'alias ampache-localplay-vlc=vlc -I qt --extraintf http --http-port 40000'
  vlc -I qt --extraintf http --http-port 40000 $argv;
end
