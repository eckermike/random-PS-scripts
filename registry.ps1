$test = Get-ChildItem "hklm:\SYSTEM\ControlSet001\Enum\USB" -recurse -Force 
$arr = @()
$arr2= @()
foreach($reg in $test){
  $name = $reg.name
  if($name -match '.+?Device parameters$'){$arr += $name}
}
foreach($item in $arr){
    $path = $item.Replace("HKEY_LOCAL_MACHINE", "HKLM:")
    set-itemproperty -path $path -name EnableSelectiveSuspend -value 0
    set-itemproperty -path $path -name DeviceSelectiveSuspend -value 0

   
} 

#set-ItemProperty 'hklm:\SYSTEM\ControlSet001\Enum\USB\ROOT_HUB20\4&56890eb&0\Device Parameters' -Name enableselectivesuspend -Value 0 