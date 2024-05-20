function sds --wraps="systemctl status"
  systemctl status $argv; 
end
