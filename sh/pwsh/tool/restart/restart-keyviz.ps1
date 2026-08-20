
# restart KeyViz

$processName = "keyviz"
$exePath = "C:\Program Files\keyviz\keyviz.exe"

Stop-Process -Name $processName -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1
Start-Process $exePath

