function url_encode

  echo $argv[1] | jq -Rr '@uri'
end

