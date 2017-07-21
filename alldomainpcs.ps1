[System.Collections.ArrayList] $PCS = @()
$domainse = @('dc=doit,dc=state,dc=in,dc=us','dc=fssa,dc=state,dc=in,dc=us','dc=isp,dc=state,dc=in,dc=us','dc=shared,dc=state,dc=in,dc=us')
$date = Get-Date
foreach($domain in $DOMAINSe){
$server = $domain -replace ',','.'
$server = $server -replace 'dc=',''


$ous = (Get-ADOrganizationalUnit -Properties * -SearchBase $domain -SearchScope Subtree -Server $server -Filter *).distinguishedname
$path = 'c:\nonstate\'+$server.Split('.')[0]+'pcs.txt'
$server | Out-File $path -Append
$name = $server.Split('.')[0]+'pcs.txt'
#New-Item -Path C:\nonstate -ItemType file -Name $name | out-file -FilePath C:\garbage.txt -Force
 foreach($ou in $ous){
 if(($ou -notlike '*OU=Billing only*') -and ($ou -notlike '*digimarc*')){
$computers = get-adcomputer -SearchBase $ou -SearchScope OneLevel  -Properties operatingsystem -Filter {(operatingsystem -notlike '*server*') -and (enabled -eq "True") -and (operatingsystem -notlike '*xp*') -and (operatingsystem -notlike 'windows nt') -and (operatingsystem -notlike '*cluster*') -and (operatingsystem -notlike '*Windows 2000*')} -Server $server
if($computers.count -gt 0){
echo $ou | Out-File $path -Append
echo $computers.count | Out-File $path -Append
} 
foreach($computer in $computers){
    $PCobject = Get-ADComputer -Identity $computer.name -Properties * -Server $server
    $pwdLastSet = [DateTime]::FromFiletime([Int64]::Parse($PCobject.pwdLastSet)) 
    $TimeSince = New-TimeSpan $pwdLastSet $date
    $OS = $PCObject.OperatingSystem
    $enabled = $PCobject.Enabled
    if(($OS -notlike '*server*') -and ($enabled -eq "True") -and ($OS -notlike '*xp*') -and ($TimeSince.TotalDays -lt 100)){
    
    $pcs.Add($PCobject) | out-file -FilePath c:\garbage.txt -Force}
    }

    }
 }



 }

