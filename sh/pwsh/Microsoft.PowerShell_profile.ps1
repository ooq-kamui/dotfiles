
function prompt {
  # "PS " + $( get-location ) + "> "
  "_ "
}

# bell sound

Set-PSReadlineOption -BellStyle None

# 
# color
# 

# $PSStyle.FileInfo.Directory = $PSStyle.Foreground.BrightGreen
$PSStyle.FileInfo.Directory = $PSStyle.Foreground.BrightCyan

Set-PSReadLineOption -Colors @{ InlinePrediction = $PSStyle.Foreground.BrightGreen  }
Set-PSReadLineOption -Colors @{ Parameter        = $PSStyle.Foreground.BrightYellow }
Set-PSReadLineOption -Colors @{ Variable         = $PSStyle.Foreground.BrightCyan   }
Set-PSReadLineOption -Colors @{ String           = $PSStyle.Foreground.BrightCyan   }


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

# src alias, fnc, can not
#Set-Alias src "."

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

function l  {
  param( $path )

  if      ( $path -eq $null ) {

    fd -d 1 '' .

  }elseif ( ( Get-Item $path ) -is [System.IO.DirectoryInfo] ) {

    fd -d 1 '' $path

  }elseif ( ( Get-Item $path ) -is [System.IO.FileInfo] ) {

    echo $path

  }else {

    fd -d 1 '' .
  }
}

function lf {
  param( $path )

  fd --type f '' $path
}

function ld {
  param( $path )

  fd --type d '' $path
}

function lr {
  param( $path )

  fd          '' $path
}

# Set-Alias dir "z"
# Set-Alias di "z"
# function dir {
function di {
  param( $path )

  z $path
}

function k   { Set-Location -Path ..       ; pwd }
function kk  { Set-Location -Path ..\..    ; pwd }
function kkk { Set-Location -Path ..\..\.. ; pwd }


# psfzf

Import-Module PSFzf
Enable-PsFzfAliases
Set-PsFzfOption -PSReadlineChordProvider       'Ctrl+y'
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'


function touch {
  param( $path )

  # echo $path
  New-Item -Type File $path
}
Set-Alias to "touch"


Set-Alias vim "nvim"
Set-Alias vi  "nvim"
# function vim { nvim -p }
# function vi  { nvim -p }

function vif {

  vi -p ( fzf )
}


function da  { Get-Date -Format "yyyy-MM-dd"       }
function dt  { Get-Date -Format "yyyy-MM-dd.HH:mm" }
# function ts  { Get-Date -Format "yyyy-MM-dd.HH:mm:??" }

Set-Alias opn "explorer"



# def

$wrk          = "$home/wrk"

function cnf {
  param( $subcmd )

  if      ( $subcmd -eq 'src' ) {

    echo $subcmd
    # src alias, fnc, can not
    #. $profile

  }elseif ( $subcmd -eq 'cd' ) {

    cd $home\OneDrive\Documents\PowerShell\

  }elseif ( $subcmd -eq 'vi' ) {

    vi -p $home\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

  }elseif ( $subcmd -eq 'cp' ) {

    cp $home\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 $home\wrk\cnf\sh\pwsh\

  }else {

    echo $subcmd' ?'
  }
}

$doc_dir      = "$wrk/doc"
$doc_tech_dir = "$doc_dir/doc-tech"

function memo {
  param( $subcmd, $ptn )

  if      ( $subcmd -eq 'pw' ) {

    rg -N -B 2 'pw' $doc_dir/

  }elseif ( $subcmd -eq 'cd' ) {

    cd $doc_tech_dir/

  }elseif ( $subcmd -eq 'fd' ) {

    fd "$ptn" $doc_dir/

  }elseif ( $subcmd -eq 'rg' ) {

    rg -N -A 0 "$ptn" $doc_dir/
  }
}

