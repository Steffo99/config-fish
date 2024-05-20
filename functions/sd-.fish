function sd- --wraps="systemctl disable"
  systemctl disable --now $argv; 
end
