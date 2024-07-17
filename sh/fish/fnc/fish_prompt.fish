function fish_prompt --description 'Write out the prompt'
  if test -z $WINDOW
    #printf '%s%s ' (set_color purple) (prompt_hostname)
    #printf '%s%s ' (set_color f6f) $USER
    #printf '%s%s ' (set_color f6f) '_'
    printf '%s%s' (set_color f6f) '_'

    set last_status $status
    printf '%s ' (__fish_git_prompt)
    set_color normal

  else
    printf '%s%s@%s%s(%s)%s $ ' (set_color purple) (whoami) (prompt_hostname) (set_color white) (echo $WINDOW) (set_color normal)
  end
end

