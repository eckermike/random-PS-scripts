$alphu=@('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
$alph=@('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
$num = @(1,2,3,4,5,6,7,8,9,0)
$char = @('@','$','%')
$length = 0
$passarr = @()
while($length -lt 15){
    $length++
    $arr = @(1,2,3,4)
    $prev = $cur
    $cur = Get-Random $arr
    while($cur -eq $prev){
        $cur = Get-Random $arr
    }
    if($cur -eq 1){ $digit = Get-Random $alphu}
    if($cur -eq 2){ $digit = Get-Random $alph}
    if($cur -eq 3){ $digit = Get-Random $num}
    if($cur -eq 4){ $digit = Get-Random $char}
    $passarr+=$digit
}
$ofs = ""
$password = "$passarr".ToString()