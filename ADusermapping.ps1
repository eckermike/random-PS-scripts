$ous = (Get-ADOrganizationalUnit -Properties * -SearchBase "OU=agencies,DC=state,DC=in,DC=us" -SearchScope subtree -Server state.in.us -Filter *).distinguishedname
$stackGPO = New-Object System.Collections.Stack
$arrGPO = New-Object System.Collections.ArrayList
Start-Transcript -Path c:stateuser.txt -Force
foreach($ou in $ous){
$users = Get-ADuser -SearchBase $ou -SearchScope subtree -Filter 'enabled -eq "True"' -Server state.in.us
if($users.count -gt 0){
echo $ou
echo $users.count
$links = Get-GPInheritance -Target $ou -Domain state.in.us
echo $links.GpoLinks.displayname 
$inherited = $links.InheritedGpoLinks.displayname
foreach($obj in $inherited){
   #IF(-not $stackGPO.Contains($obj)){
   $stackGPO.push($obj) 
   }
    echo $stackgpo

echo $users.count
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