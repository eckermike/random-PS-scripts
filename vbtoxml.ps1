cd C:\

$lines = get-content  C:\iotlogon.txt | ? {$_.trim() -ne "" }
#$maingroup = $item -replace ".{4}$"
#$maingroupsid = (get-adgroup -Identity $maingroup -Server $dor).sid.value
$alph=@()
65..90|foreach-object{$alph+=[char]$_}
$xml = '<?xml version="1.0" encoding="utf-8"?><Drives clsid="{8FDDCC1A-0C3C-43cd-A6B4-71A6DF20DA8C}" disabled="1">'
$xmlpath = 'c:\iot.xml'
echo $xml | Out-File $xmlpath -Append
foreach($line in $lines) {
$line = $line.ToUpper()
if(($line.length -gt 1) -and (!($line.StartsWith("\\")))) { $group2 = $line 
$doxml = 1}

if($alph -ccontains $line) {$letter = $line
$doxml = 1}
if($line.StartsWith("\\")){$path = $line
$doxml = 0}
try{
if($group2 = 'MPH Shared Drive'){$group2sid = (get-adgroup -Identity $group2 -Server $state).sid.value}
else{$group2sid = (get-adgroup -Identity $group2 -Server $doit).sid.value}}
catch{
$message = $group2 + " is invalid for " + $line
echo $message}
$xml = '<Drive clsid="{935D1B74-9CB8-4e3c-9914-7DD559B7A417}" name="' + $letter + ':" status="' + $letter + ':" image="1" changed="2017-05-09 11:44:29" uid="{C3269D33-5D24-4F29-98B6-017526EB255A}" bypassErrors="1"><Properties action="R" thisDrive="NOCHANGE" allDrives="NOCHANGE" userName="" path="' + $path + '" label="" persistent="1" useLetter="1" letter="' + $letter + '"/><Filters><FilterGroup bool="AND" not="0" name="' + $group2 + '" sid="'+ $group2sid +'" userContext="1" primaryGroup="0" localGroup="0"/></Filters></Drive>'

if ($doxml -eq 0){echo $xml | Out-File $xmlpath -Append}
}

$xml = '</Drives>'

echo $xml | Out-File $xmlpath -Append

# $xml = '<Drive clsid="{935D1B74-9CB8-4e3c-9914-7DD559B7A417}" name="V:" status="V:" image="1" changed="2017-05-09 11:44:29" uid="{C3269D33-5D24-4F29-98B6-017526EB255A}" bypassErrors="1"><Properties action="R" thisDrive="NOCHANGE" allDrives="NOCHANGE" userName="" path="\\iotfilp50pw.shared.state.in.us\indot5\shared\ex\ex-div" label="" persistent="1" useLetter="1" letter="V"/><Filters><FilterGroup bool="AND" not="0" name="DOT\DOT_COMMON_EX-DIV_V" sid="S-1-5-21-940319540-1452877802-254238600-33941" userContext="1" primaryGroup="0" localGroup="0"/><FilterGroup bool="AND" not="0" name="DOT\DOT_Executive_SCRIPT" sid="S-1-5-21-940319540-1452877802-254238600-33950" userContext="1" primaryGroup="0" localGroup="0"/></Filters></Drive>'


