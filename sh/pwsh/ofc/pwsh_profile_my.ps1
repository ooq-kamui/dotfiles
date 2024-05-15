
function prompt {
  # "PS " + $( get-location ) + "> "
  "_ "
}

# bell sound

Set-PSReadlineOption -BellStyle None

# color

# $PSStyle.FileInfo.Directory = $PSStyle.Foreground.BrightGreen
$PSStyle.FileInfo.Directory = $PSStyle.Foreground.BrightCyan

Set-PSReadLineOption -Colors @{ InlinePrediction = $PSStyle.Foreground.BrightGreen  }
Set-PSReadLineOption -Colors @{ Parameter        = $PSStyle.Foreground.BrightYellow }
Set-PSReadLineOption -Colors @{ Variable         = $PSStyle.Foreground.BrightCyan   }


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

# function dir {
function di {
  param( $path )

  z $path
}

function k   { Set-Location -Path ..       ; pwd }
function kk  { Set-Location -Path ..\..    ; pwd }
function kkk { Set-Location -Path ..\..\.. ; pwd }


# fzf

$env:FZF_DEFAULT_OPTS = '--ansi --bind=ctrl-o:accept,ctrl-l:forward-char,ctrl-f:forward-word'

# psfzf

# Import-Module PSFzf
# Enable-PsFzfAliases
Set-PsFzfOption -PSReadlineChordProvider       'Ctrl+y'
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'


function touch {
  param( $path )

  # echo $path
  New-Item -Type File $path
}
Set-Alias to "touch"

function vim {

  nvim -p $args
}

function vi {

  nvim -p $args
}


function da  { Get-Date -Format "yyyy-MM-dd"       }
function dt  { Get-Date -Format "yyyy-MM-dd.HH:mm" }
function tm  { Get-Date -Format "HH:mm"            }
# function ts  { Get-Date -Format "yyyy-MM-dd.HH:mm:??" }


function opn {
  param( $path )

  if ( $path -eq $null ) {

    $path = ( Get-Location )
  }

  explorer $path
}



# def

$wrk               = "$home\wrk"
$profile_dir       = "$home\Documents\PowerShell"
$profile_file_name = "Microsoft.PowerShell_profile.ps1"
$profile_file_path = "$profile_dir\$profile_file_name"

function cnf {
  param( $subcmd )

  if      ( $subcmd -eq 'src' ) {

    echo "$subcmd : do : . $profile"
    # . $profile

  }elseif ( $subcmd -eq 'cd' ) {

    cd $profile_dir

  }elseif ( $subcmd -eq 'vi' ) {

    vi -p $profile_file_path $wrk\cnf\sh\pwsh\$profile_file_name

  }elseif ( $subcmd -eq 'slf' ) {

    vi -p $profile_file_path $wrk\cnf\sh\pwsh\$profile_file_name

  }elseif ( $subcmd -eq 'cp' ) {

    # cp $home\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 $home\wrk\cnf\sh\pwsh\
    echo $subcmd' dev doing..'

  }else {

    echo $subcmd' ?'
  }
}

$prj_dir      = "$wrk/prj"
$doc_tech_dir = "$wrk/doc-tech"

function memo {
  param( $subcmd, $ptn )

  if      ( $subcmd -eq 'pw' ) {

    rg -N -B 2 -w 'pw' $prj_dir/

  }elseif ( $subcmd -eq 'cd' ) {

    cd $doc_tech_dir/

  }elseif ( $subcmd -eq 'fd' ) {

    fd "$ptn" $prj_dir/

  }elseif ( $subcmd -eq 'rg' ) {

    rg -N -A 0 "$ptn" $prj_dir/
  }
}



