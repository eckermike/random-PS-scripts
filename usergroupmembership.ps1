# Get-ADUser -SearchBase 'DC=fssa,dc=state,dc=in,dc=us' -SearchScope Subtree -Filter * -Properties name, memberof, canonicalname, objectsid -Server $fssa | select name, memberof, canonicalname, objectsid | Export-Csv c:\test.csv
$users = (Get-ADUser -SearchBase 'DC=fssa,dc=state,dc=in,dc=us' -SearchScope Subtree -Filter * -Properties samaccountname -Server $fssa).samaccountname
foreach($user in $users){
$name = "C:\fssa\groupmembership\" + $user + '.txt'
new-item -Path "C:\fssa\groupmembership" -Name $user -ItemType File -Force
Get-ADuser -Identity $user -Server $fssa -Properties memberof | select memberof | Out-File -FilePath $name -Append
}


 