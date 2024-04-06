
function prompt{
  # "PS " + $( get-location ) + "> "
  "_ "
}

Import-Module PSReadline
Set-PSReadLineOption -EditMode Emacs

Set-PSReadLineKeyHandler -Key Ctrl+j -Function AcceptLine

Set-PSReadLineKeyHandler -Key Ctrl+o -Function BackwardWord
Set-PSReadLineKeyHandler -Key Ctrl+f -Function ForwardWord
Set-PSReadLineKeyHandler -Key Ctrl+s -Function BackwardChar
Set-PSReadLineKeyHandler -Key Ctrl+l -Function ForwardChar
Set-PSReadLineKeyHandler -Key Ctrl+k -Function DeleteEndOfWord
Set-PSReadLineKeyHandler -Key Ctrl+i -Function Complete

# zoxide ( z )
Invoke-Expression (& { (zoxide init powershell | Out-String) })


# alias ( function )

Set-Alias p "pwd"

Set-Alias ll  "ls"

# Set-Alias dir "z"
Set-Alias di "z"

# Set-Alias k   "Set-Location -Path .."
# Set-Alias kk  "cd ..\.."
# Set-Alias kkk "cd ..\..\.."

function k   { Set-Location -Path ..       }
function kk  { Set-Location -Path ..\..    }
function kkk { Set-Location -Path ..\..\.. }

Set-Alias vi  "nvim"
Set-Alias vim "nvim"



