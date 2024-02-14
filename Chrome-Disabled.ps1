#Script Write to disable Chrome updates
#Writen By Andrew Price
#dru0pa@gmail.com

# Define log file path (replace with your preferred location and name)
$logFilePath = "$env:USERPROFILE\Desktop\service_disable_$(Get-Date -UFormat "%Y-%m-%d_%H-%m-%S").log"

(Get-Date).ToString($dateFormat) | Out-File -FilePath $logFilePath -Append
#
Add-Content $logFilePath "This is going to Stop and Disable the gupdate and gupdatem."
Add-Content $logFilePath "These are the Google services to stop Chrome from updating."

# Stop gupdate service
Stop-Service -Name gupdate -PassThru | Out-File -FilePath $logFilePath -Append
Add-Content $logFilePath "The service gupdate has been Stopped."

# Stop gupdatem service
Stop-Service -Name gupdatem -PassThru | Out-File -FilePath $logFilePath -Append
Add-Content $logFilePath "The service gupdatem has been Stopped."

# Disable gupdate service
Set-Service -Name gupdate -StartupType Disabled
Add-Content $logFilePath "`nThe service 'gupdate' has been Disabled."
(Get-Service 'gupdate').StartType | Out-File -FilePath $logFilePath -Append

# Disable gupdatem service
Set-Service -Name gupdatem -StartupType Disabled
Add-Content $logFilePath "`nThe service 'gupdatem' has been Disabled."
(Get-Service 'gupdatem').StartType | Out-File -FilePath $logFilePath -Append

# Show the contents of the log file
Get-Content $logFilePath



