$computer = 'CNU409DNNC'
$issue = '1519857'

$path = '\\'+ $computer + '\c$\'
$test = test-path -Path $path
$body = 'is online for issue' + $issue + '.'
while($test -eq $false){
$test = Test-Path -Path $path
Start-Sleep -Seconds 900
}

Send-MailMessage -To meckerle@iot.in.gov  -From TEST@iot.in.gov -SmtpServer mailrelay.iot.in.gov -Subject $computer -Body $body