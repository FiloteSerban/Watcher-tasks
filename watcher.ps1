$ignoredUsers = "SYSTEM", "LOCAL SERVICE", "DWM-1", "NETWORK SERVICE", "UMFD-0", "UMFD-1"

$events = Get-Winevent -FilterHashtable @{ ID=4624; LogName = "Security"; StartTime = (Get-Date).AddMinutes(-30) } | ?{ $users.Contains($_.Properties[5].Value) -eq $false }

if $events.Length > 0 {
Invoke-AutomationWatcherAction -Message "gigaadmin123 parolamea"
}

