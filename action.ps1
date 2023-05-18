param(
    $EVENTDATA
)

$split_out = $EVENTDATA.EventProperties.Message.Split(" ")
Write-Output($split_out[0])
Write-Output($split_out[1])