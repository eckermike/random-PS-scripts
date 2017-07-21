Get-Content -Path H:\principalname.txt | % { 
$uPN = $_
 Get-ADUser -Filter { UserPrincipalName -Eq $UPN } -Properties * -Server $fssa | select name | Out-File c:\principal.txt -Appendset
 }