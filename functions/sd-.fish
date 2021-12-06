function sd- --wraps='systemctl stop' --wraps='systemctl disable --now' --description 'alias sd- systemctl disable --now'
  systemctl disable --now $argv; 
end
