
function prompt {
  # "PS " + $( get-location ) + "> "
  $brnch = ( Write-VcsStatus )

  if ($brnch){
    $brnch.Trim() + " "
  }else {
    "_ "
  }
}

Import-Module PSReadline

# auto complete

# key bind

Set-PSReadLineOption -EditMode Emacs

Set-PSReadLineKeyHandler -Key Ctrl+j -Function AcceptLine
Set-PSReadLineKeyHandler -Key Ctrl+s -Function BackwardChar
Set-PSReadLineKeyHandler -Key Ctrl+l -Function ForwardChar
Set-PSReadLineKeyHandler -Key Ctrl+o -Function BackwardWord
Set-PSReadLineKeyHandler -Key Ctrl+f -Function ForwardWord
Set-PSReadLineKeyHandler -Key Ctrl+w -Function BackwardDeleteWord
Set-PSReadLineKeyHandler -Key Ctrl+k -Function DeleteEndOfWord

Set-PSReadLineKeyHandler -Key Tab    -Function MenuComplete
Set-PSReadLineKeyHandler -Key Ctrl+i -Function MenuComplete
# Set-PSReadLineKeyHandler -Key Ctrl+i -Function NextCompletion
# Set-PSReadLineKeyHandler -Key Ctrl+i -Function TabCompleteNext
# Set-PSReadLineKeyHandler -Key Ctrl+u -Function Complete


# read line list view
# Set-PSReadLineOption -PredictionViewStyle ListView
# Set-PSReadLineOption -PredictionSource HistoryAndPlugin

# color

$PSStyle.FileInfo.Directory = $PSStyle.Foreground.BrightCyan

Set-PSReadLineOption -Colors @{ InlinePrediction = $PSStyle.Foreground.Cyan         }
Set-PSReadLineOption -Colors @{ Command          = $PSStyle.Foreground.BrightCyan   }
Set-PSReadLineOption -Colors @{ Parameter        = $PSStyle.Foreground.BrightYellow }
Set-PSReadLineOption -Colors @{ Variable         = $PSStyle.Foreground.BrightCyan   }
Set-PSReadLineOption -Colors @{ String           = $PSStyle.Foreground.BrightGreen  }
Set-PSReadLineOption -Colors @{ Selection        = $PSStyle.Foreground.BrightGreen  }

# bell sound
Set-PSReadlineOption -BellStyle None

# zoxide ( z )
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# rg

$env:RIPGREP_CONFIG_PATH = "$home\wrk\pri\dotfiles\cli\rg\ripgreprc\pwsh\.ripgreprc"

# fzf

$env:FZF_DEFAULT_OPTS    = '--ansi --bind=ctrl-o:accept,ctrl-l:forward-char,ctrl-f:forward-word'
# $env:FZF_DEFAULT_COMMAND = 'fd --hidden -I --exclude .git --follow --color=always'
$env:FZF_DEFAULT_COMMAND = 'fd --hidden    --exclude .git --follow --color=always'
$env:FZF_CTRL_T_COMMAND  = "$env:FZF_DEFAULT_COMMAND"

# psfzf

# Import-Module PSFzf
# Enable-PsFzfAliases
Set-PsFzfOption -PSReadlineChordProvider       'Ctrl+y'
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'

# 
# alias ( function )
# 

# Set-Alias clr "clear; pwd"
function clr {

  clear
  pwd | Convert-Path
}
# Set-Alias c   "clear"
Set-Alias c   "clr"

Set-Alias clp "clip"  -force # alias xxx is read-only or


function pth {
  param( $path )

  if ( $path -eq $null ) {
    pwd | Convert-Path

  }else {
    Convert-Path $path
  }
}
Set-Alias o "pth"

function ll     { Get-ChildItem -force $args }
function oo_ll  { Get-ChildItem -force ..    }
function ooo_ll { Get-ChildItem -force ..\.. }

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

function mkd {

  mkdir $args

  # ll
}

function dir_jmp {
  # param( $key )

  if ( [string]::IsNullOrEmpty( $args ) ) {

    $dir = ( zoxide query --list | fzf )
    # echo $dir
    cd $dir

  }else {
    # z @( $args )
    z $args[0] $args[1] $args[2]
  }

  pth
}
# Set-Alias dir "dir_jmp" -Option AllScope # cannot be removed
Set-Alias f   "dir_jmp"
function fo { dir_jmp dotfiles }

function k    { Set-Location -Path .. ; pth }
function kk   { k;k     }
function kkk  { k;k;k   }
function kkkk { k;k;k;k }

function kj {

  $dir = ( git rev-parse --show-cdup )

  if ($dir -ne ''){
    cd $dir
  }
}

function touch {
  param( $path )

  # echo $path
  New-Item -Type File $path
}
Set-Alias to "touch"

function rm_dmy {
  echo "rm"

  Remove-Item -Confirm $args
}
Set-Alias rm "rm_dmy" -Option AllScope # cannot be removed


function vi {

  $arg_list = wild_card_parse $args
  # echo $arg_list

  nvim -p $arg_list
}

function vi_lf {

  nvim -p ( lf )
}

function wild_card_parse {

  if ($args -ne $null){
    $args = $args.Split(' ')
  }

  $path_list = @()

  foreach ($arg in $args){
    # echo "for $arg"

    if ($arg.Contains('*')){ # wild card
      # echo 'wild card'

      $tmp_list = ( Get-ChildItem $arg -Name )

      if ($tmp_list.Count -gt 0){

        $path_list += $tmp_list
      }
    }else {
      $path_list += $arg
    }
  }
  # echo $path_list
  return ,$path_list
}

function opn {
  param( $path )

  if ( $path -eq $null ) {

    # $path = ( Get-Location )
    $path = Get-Location
  }

  explorer $path
}

function da { Get-Date -Format "yyyy-MM-dd"       }
function dt { Get-Date -Format "yyyy-MM-dd.HH:mm" }
function tm { Get-Date -Format "HH:mm"            }
function ts { Get-Date -Format "yyyy-MM-dd.HH:mm:ss" }
Set-Alias t "ts"

# git
Set-Alias ji  "git"    -force # alias xxx is read-only or
function j   { git status }
function jl  { git log }
function jj  { git add .; git status }
# function jp  { git pull origin main }
function jp  { git pull $args }

function jsl { git sl }
function jsd { git sd }
function jwl { git wl }
function jwd { git wd }

function cd_git_root {

  $dir = ( git rev-parse --show-cdup )

  if ( $dir -ne '' ) {
    cd $dir
  }

  pth
}
Set-Alias kr "cd_git_root"

function git_st_file_lst {

  $tmp_file_path = New-TemporaryFile

  git sl >> $tmp_file_path.FullName
  git wl >> $tmp_file_path.FullName

  Get-Content $tmp_file_path.FullName | Sort-Object -Unique
}

$fzf_git_st_file_lst = {
  $selected = ( git_st_file_lst | fzf | Out-String )

  if ($selected) {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($selected.Trim())
  }
}
Set-PSReadLineKeyHandler -Key "Ctrl+u" -BriefDescription "GitStatusFileListWithFzf" -ScriptBlock $fzf_git_st_file_lst


# posh-git
Import-Module posh-git

# zip
# todo dev

# jq
$ENV:Path += ";$home\wrk\app\bin\pwsh"
Set-Alias jq "jq-windows-amd64"

# gcal
$ENV:Path += ";C:\Program Files (x86)\GnuWin32\bin"
function cal {

  gcal (date).AddMonths(-1).toString("MM yyyy").split()
  gcal (date).AddMonths( 0).toString("MM yyyy").split()
  gcal (date).AddMonths( 1).toString("MM yyyy").split()
}
Set-Alias ca  "cal"

function ba {

  Get-CimInstance -ClassName Win32_Battery | Select-Object -Property EstimatedChargeRemaining
}

function ggl { start chrome }

function say {
  # param( $str )

  # ( New-Object -ComObject SAPI.SpVoice ).Speak( $str )
  ( New-Object -ComObject SAPI.SpVoice ).Speak( $args )
}

# postgres, psql
$ENV:Path += ";C:\Program Files\PostgreSQL\16\bin"

# def

$wrk_dir           = "$home\wrk"
$profile_dir       = "$wrk_dir\pri\dotfiles\sh\pwsh\profile"
$profile_file_name = "pwsh_profile.ps1"
$profile_file_path = "$profile_dir\$profile_file_name"

function cnf {
  param( $subcmd )

  if      ( $subcmd -eq 'src' ) {

    echo "$subcmd : do : . $profile"
    # . $profile

  }elseif ( $subcmd -eq 'cd' ) {

    if ( Test-Path "$home\OneDrive\Documents\PowerShell" ) {

      $profile_env_dir = "$home\OneDrive\Documents\PowerShell"
    }else {
      $profile_env_dir = "$home\Documents\PowerShell"
    }
    cd $profile_env_dir

  }elseif ( $subcmd -eq 'vi' ) {

    vi -p $profile_file_path

  }elseif ( $subcmd -eq 'slf' ) {

    vi -p $profile_file_path

  }else {
    echo $subcmd' ?'
  }
}

function ssh-hyper-v {
  param(
    [Parameter(Mandatory, Position = 0)]
    [ValidatePattern('.+@.+')]
    [string]$Destination
  )

  $UserName, $VMName = $Destination -split '@', 2

  $ip = (Get-VMNetworkAdapter -VMName $VMName).IPAddresses |
    Where-Object { $_ -match '^\d+\.\d+\.\d+\.\d+$' } |
    Select-Object -First 1

  if (-not $ip) {
    Write-Error "Failed to get IPv4 address for VM '$VMName'. Ensure the VM is running and hv_kvp_daemon is active."
    return
  }

  Write-Host "Connecting to $UserName@$ip ..." -ForegroundColor Cyan
  ssh "$UserName@$ip"
}

function zscaler-cer-export {
    <#
    .SYNOPSIS
        Zscaler のルート証明書をすべて 1 つの Base-64 (PEM) バンドルに出力します。

    .DESCRIPTION
        証明書ストアから件名 (Subject) に "Zscaler" を含む証明書をすべて検索し、
        1 つの PEM ファイルに連結して保存します。Zscaler は同名ルート CA が
        複数 (新旧世代など) 存在することがあるため、まとめて 1 ファイルにします。
        curl / Python (REQUESTS_CA_BUNDLE) / Git / WSL などでそのまま利用できます。

        検索キーワードは "Zscaler" 固定です。

    .PARAMETER StoreLocation
        検索するストアの場所。LocalMachine または CurrentUser。既定は CurrentUser。

    .PARAMETER StoreName
        検索するストア名。既定は Root (信頼されたルート証明機関)。

    .PARAMETER FilePath
        出力先のファイルパス。未指定の場合はダウンロードフォルダに zscaler-bundle.pem を生成します。

    .EXAMPLE
        Export-ZscalerCertBundle
        Zscaler のルート証明書をすべて 1 つの PEM にまとめてダウンロードフォルダに保存します。

    .EXAMPLE
        Export-ZscalerCertBundle -StoreLocation LocalMachine -FilePath "C:\certs\zscaler-bundle.pem"
    #>
    [CmdletBinding()]
    param(
        [ValidateSet('LocalMachine', 'CurrentUser')]
        [string]$StoreLocation = 'CurrentUser',

        [string]$StoreName = 'Root',

        [string]$FilePath
    )

    # 検索キーワードは Zscaler 固定
    $subjectKeyword = 'zscaler'
    $storePath = "Cert:\$StoreLocation\$StoreName"

    # 一致する証明書をすべて取得し、拇印で重複を除去
    $certs = Get-ChildItem -Path $storePath |
        Where-Object { $_.Subject -like "*$subjectKeyword*" } |
        Sort-Object Thumbprint -Unique

    if (-not $certs) {
        Write-Error "$storePath に '$subjectKeyword' に一致する証明書が見つかりませんでした。"
        return
    }

    # 出力先の決定 (既定はダウンロードフォルダ)
    if (-not $FilePath) {
        $downloadDir = Join-Path $env:USERPROFILE 'Downloads'
        $FilePath = Join-Path $downloadDir "$subjectKeyword-bundle.pem"
    }

    # 各証明書を PEM ブロックにして連結
    $sb = [System.Text.StringBuilder]::new()
    foreach ($cert in $certs) {
        $base64 = [System.Convert]::ToBase64String($cert.RawData, [System.Base64FormattingOptions]::InsertLineBreaks)
        # 可読性のため、各ブロックの前に対象証明書のコメントを付与
        [void]$sb.AppendLine("# Subject    : $($cert.Subject)")
        [void]$sb.AppendLine("# Thumbprint : $($cert.Thumbprint)")
        [void]$sb.AppendLine("# NotAfter   : $($cert.NotAfter)")
        [void]$sb.AppendLine("-----BEGIN CERTIFICATE-----")
        [void]$sb.AppendLine($base64)
        [void]$sb.AppendLine("-----END CERTIFICATE-----")
    }

    # ASCII / 改行 LF で保存
    [System.IO.File]::WriteAllText($FilePath, $sb.ToString(), [System.Text.Encoding]::ASCII)

    Write-Host "Zscaler バンドルを出力しました ($(@($certs).Count) 件):" -ForegroundColor Green
    $certs | Format-Table Thumbprint, Subject, NotAfter -AutoSize | Out-String | Write-Host
    Write-Host "  File : $FilePath"

    return $FilePath
}

