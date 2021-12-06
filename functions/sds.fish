function sds --wraps='systemctl status' --description 'alias sds systemctl status'
  systemctl status $argv; 
end
