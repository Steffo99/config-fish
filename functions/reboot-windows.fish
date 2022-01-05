function reboot-windows --wraps='systemctl reboot --boot-loader-entry=windows.conf' --description 'alias reboot-windows systemctl reboot --boot-loader-entry=windows.conf'
  systemctl reboot --boot-loader-entry=windows.conf $argv; 
end
