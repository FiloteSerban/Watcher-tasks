param(
    $EVENTDATA
)

$split_out = $EVENTDATA.EventProperties.Message.Split(" ")
Write-Output("wtf")
Write-Output($split_out[0])
Write-Output($split_out[1])

$username = Get-LocalUser -Name $split_out[0] -ErrorAction SilentlyContinue
if($username) {
    Write-Output("User already exists.")
} else {
    $username = $split_out[0]
    $pass = ConvertTo-SecureString -String $split_out[1] -AsPlainText -Force

    New-LocalUser -Name $username -Password $pass -FullName 'Ion Ion' -Description 'Watcher task demo' -AccountNeverExpires

    Add-LocalGroupMember -Group 'Administrators' -Member $username
}