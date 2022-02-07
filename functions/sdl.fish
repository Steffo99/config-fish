function sdj --wraps='journalctl -u' --description 'alias sdj journalctl -u'
  journalctl -u $argv;
end
