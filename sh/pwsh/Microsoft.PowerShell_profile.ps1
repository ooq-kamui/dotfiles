
function prompt {
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

Set-Alias clr "clear"
Set-Alias c   "clear"

# Set-Alias clp "clip"
function clp {

  # clip
}

Set-Alias p "pwd"

function pth {

  # ??
}

Set-Alias ll "Get-ChildItem"
function l  { fd -d 1     }
function lf { fd --type f }
function ld { fd --type d }
function lr { fd          }

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

function da  { Get-Date -Format "yyyy-MM-dd"       }
function dt  { Get-Date -Format "yyyy-MM-dd.HH:mm" }
# function ts  { Get-Date -Format "yyyy-MM-dd.HH:mm:??" }


# def

$wrk = "$home/wrk"


function memo {

  param( $subcmd )

  if ( $subcmd -eq 'pw' ) {

    echo $subcmd
    # rg 'pw' $home/wrk/doc/
    rg 'pw' $wrk/doc/
  }
}

function cnf {

  param( $subcmd )

  if      ( $subcmd -eq 'src' ) {

    . $profile

  }elseif ( $subcmd -eq 'cp' ) {

    cp $home\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 $home\wrk\cnf\sh\pwsh\

  }elseif ( $subcmd -eq 'vi' ) {

    echo $subcmd
    # ??
    # vi -p $home/wrk/doc/OneDrive/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
  }
}



