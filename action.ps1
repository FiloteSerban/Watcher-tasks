param(
    $EVENTDATA
)

$split_out = $EVENTDATA.EventProperties.Message.Split(" ")
$username = Get-LocalUser -Name $split[0] -ErrorAction SilentlyContinue
if($username) {
    Write-Output("User already exists.")
} else {
    $username = $split[0]
    $pass = ConvertTo-SecureString -String $split[1] -AsPlainText -Force

    New-LocalUser -Name $username -Password $pass -FullName 'Ion Ion' -Description 'Watcher task demo' -NoPasswordExpiration

    Add-LocalGroupMember -Group 'Administrators' -Member $username
}