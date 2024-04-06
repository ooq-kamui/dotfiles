
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


# 
# alias ( function )
# 

Set-Alias c "clear"

Set-Alias p "pwd"

Set-Alias ll "Get-ChildItem"
# Set-Alias l  "fd -d 1"
function l {

  fd -d 1
}

# Set-Alias dir "z"
# Set-Alias di "z"
# function dir {
function di {

  param(
    $path
  )

  z $path
}

function k   { Set-Location -Path ..       }
function kk  { Set-Location -Path ..\..    }
function kkk { Set-Location -Path ..\..\.. }

Set-Alias vim "nvim"
Set-Alias vi  "nvim"



