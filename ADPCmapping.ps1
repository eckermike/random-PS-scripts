$ous = (Get-ADOrganizationalUnit -Properties * -SearchBase "OU=fssa,OU=Agencies,DC=state,DC=in,DC=us" -SearchScope Subtree -Server state.in.us -Filter *).distinguishedname
$stackGPO = New-Object System.Collections.Stack
$arrGPO = New-Object System.Collections.ArrayList
Start-Transcript -Path c:\fssapc.txt -Force
foreach($ou in $ous){
#$users = Get-ADuser -SearchBase $ou -SearchScope OneLevel -Filter 'enabled -eq "True"' -Server shared.state.in.us
$computers = get-adcomputer -SearchBase $ou -SearchScope OneLevel -Filter 'enabled -eq "True"' -Server state.in.us
if($computers.count -gt 0){
echo $ou
echo $computers.count
$links = Get-GPInheritance -Target $ou -Domain state.in.us
echo $links.GpoLinks.displayname 
$inherited = $links.InheritedGpoLinks.displayname
foreach($obj in $inherited){

    $stackGPO.push($obj) 

    echo $stackgpo
}
echo $computers.count
}}

 Stop-Transcript



 <#

$stackGroups = New-Object System.Collections.Stack
$arrMemberOf = New-Object System.Collections.ArrayList
 
(Get-ADObjectADO -Name $env:computername -Properties memberof).memberof | ForEach-Object{
    $stackGroups.push($_)
    $arrMemberOf.Add($_) | out-null 
    $count = $stackGroups.count
}



while ($stackGroups.Count -gt 0){
    $currentGroup = $stackGroups.Pop()
    Write-Host $currentGroup
        
    (Get-ADObjectADO -DN $currentGroup -Properties memberof).memberof | ForEach-Object {
        
        if(-Not $arrMemberOf.Contains($_)) {
            $arrMemberOf.add($_) | Out-Null
            $stackGroups.push($_)
        }

    }
              
}

#>