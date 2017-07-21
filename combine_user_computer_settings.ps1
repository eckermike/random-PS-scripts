$usergpo = 'INDOT All User Production Policy - Win10'
$computergpo = 'INDOT Windows 10 Production Computer Policy'
$userpath = 'c:\gpo\user'
$computerpath = 'c:\gpo\computer'

Backup-GPO -Name $usergpo -Path $userpath -Domain $state
Backup-GPO -Name $computergpo -Path $computerpath -Domain $state
$id = Get-ChildItem -Path C:\gpo\computer -Name 
$computerremove = $computerpath + '\' + $id + '\DomainSysvol\GPO\user'
Remove-Item -Path $computerremove -Force
$id = Get-ChildItem -Path C:\gpo\user -Name 
$userpath = $userpath + '\' + $id + '\domainsysvol\gpo\user'
$computerremove = $computerpath  + '\' +$id + '\DomainSysvol\GPO'
Copy-Item -Path $userpath -Destination $computerremove -Force
restore-gpo -Name $computergpo -Path $computerpath -Domain $state