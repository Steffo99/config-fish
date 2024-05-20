function sdj
  journalctl --follow --unit=$argv[1]
end
