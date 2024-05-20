function sd+ --wraps="systemctl enable"
  systemctl enable --now $argv; 
end
