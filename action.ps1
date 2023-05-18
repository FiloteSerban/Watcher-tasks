param(
    $EVENTDATA
)

$split_out = $EVENTDATA.EventProperties.Message.Split(" ")
Write-Output($split[0])
Write-Output($split[1])