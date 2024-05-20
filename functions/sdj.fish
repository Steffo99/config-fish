function sdj --wraps="journalctl"
  journalctl --follow --unit=$argv[1]
end
