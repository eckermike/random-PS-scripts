$lines = get-content C:\INDOT\lines.txt
$alph=@()
65..90|foreach-object{$alph+=[char]$_}
foreach($letter in $alph){
$path = 'C:\indot\'+$letter+'.txt'
foreach($line in $lines){
if($line.StartsWith('<Drive clsid="{935D1B74-9CB8-4e3c-9914-7DD559B7A417}" name="'+$letter+':"')){echo $line | out-file $path -Append}
}
}