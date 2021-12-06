function sdr --wraps='systemctl restart' --description 'alias sdr systemctl restart'
  systemctl restart $argv; 
end
