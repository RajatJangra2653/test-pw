Start-transcript -Path "C:\WindowsAzure\Logs\choco_install_log.txt" -Append


$jobs = @(
    Start-Job -ScriptBlock { choco install vscode -y -force }
    Start-Job -ScriptBlock { choco install python311 -y -force }
    Start-Job -ScriptBlock { choco install git -y -force }
)

Wait-Job -Job $jobs | Receive-Job

Stop-Transcript