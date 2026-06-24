function crt-trust-add

  if test (count $argv) -eq 0
    echo "usage: cert-trust-add <file.crt>"
    return 1
  end

  set crt $argv[1]

  if not test -f $crt
    echo "error: file not found: $crt"
    return 1
  end

  set dest /etc/pki/ca-trust/source/anchors/(basename $crt)

  sudo cp $crt $dest
  and sudo update-ca-trust

end

