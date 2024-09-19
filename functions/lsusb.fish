function lsusb --wraps=cyme --wraps='cyme --headings --tree' --description 'alias lsusb cyme --headings --tree'
  cyme --headings --tree $argv
        
end
