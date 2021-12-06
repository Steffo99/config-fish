function sd+ --wraps='systemctl start' --wraps='systemctl enable --now' --description 'alias sd+ systemctl enable --now'
  systemctl enable --now $argv; 
end
