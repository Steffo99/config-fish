function sdl --wraps='journalctl -u' --description 'alias sdl journalctl -u'
  journalctl -u $argv; 
end
