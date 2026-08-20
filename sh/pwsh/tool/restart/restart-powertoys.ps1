
# restart PowerToys

$processName = "PowerToys"
$exePath = "C:\Program Files\PowerToys\PowerToys.exe"

Stop-Process -Name $processName -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1
Start-Process $exePath

