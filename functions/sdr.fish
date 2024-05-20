function sdr --wraps="systemctl restart"
  systemctl restart $argv; 
end
