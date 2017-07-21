 $dns = @('CN=Edwards\, Keith,OU=Users,OU=Management and Performance Hub,OU=Agency Users and Groups,DC=doit,DC=state,DC=in,DC=us','CN=Kumar\, Pavan,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Vavinskiy\, Sergey,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Ciskowski\, Luke,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Hemat\, Arman,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Peirce\, Allison,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Gwaltney\, Burley J,OU=IOT Users & Groups,OU=IOT,DC=doit,DC=state,DC=in,DC=us','CN=Mareddy\, Surendranath R,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Mallarapu\, Kranthi,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Sirtosky\, Bryan J,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Pinninti\, Santhosh K,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Shah\, Darshan,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Cotterill\, Ted,OU=Users,OU=IN.Gov-AppDev-PSC,OU=Agency Users and Groups,DC=doit,DC=state,DC=in,DC=us','CN=Martin\, Joshua,OU=GEFP Users and Groups,OU=GEFP,DC=shared,DC=state,DC=in,DC=us','CN=Schenck\, Ashley,OU=Users and Groups,OU=MPH,OU=GOV,OU=Agencies,DC=shared,DC=state,DC=in,DC=us','CN=Clark\, David,OU=Gov Refresh Users and Groups,OU=GOV Refresh OUs,OU=GOV,DC=shared,DC=state,DC=in,DC=us','CN=Fasoldt\, Josie,OU=GEFP Users and Groups,OU=GEFP,DC=shared,DC=state,DC=in,DC=us','CN=Ibragic\, Alexandra K,OU=SBA Users and Groups,OU=SBA,DC=shared,DC=state,DC=in,DC=us','CN=Toney\, Jessica A,OU=GEFP Users and Groups,OU=GEFP,DC=shared,DC=state,DC=in,DC=us','CN=Gilson\, Jessica,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Marshall\, Joshua,OU=MPH Users and Groups,OU=MPH,DC=doit,DC=state,DC=in,DC=us','CN=Saravanan\, Sangeetha,OU=INK Users and Groups,OU=INK,OU=Agencies,DC=state,DC=in,DC=us','CN=Hudnall\, Jeffrey D (INK),OU=INK Users and Groups,OU=INK,OU=Agencies,DC=state,DC=in,DC=us','CN=Walker\, Lora,OU=INK Users and Groups,OU=INK,OU=Agencies,DC=state,DC=in,DC=us','CN=Torres\, Carol,OU=INK Users and Groups,OU=INK,OU=Agencies,DC=state,DC=in,DC=us','CN=Hetzel\, Matthew M,OU=INK Users and Groups,OU=INK,OU=Agencies,DC=state,DC=in,DC=us')
[System.Collections.ArrayList] $Arr = @()
[System.Collections.ArrayList] $ous = @()
foreach($distinguishedName in $dns){
 $arr = $distinguishedName.split(',') 
 $arr.RemoveAt(0)
 $arr.RemoveAt(0)
 $arr -join ',' 


 if(!($ous -match ($arr -join ','))){$ous.Add($arr -join ',')}

 }

 if(!($ous -match ($arr -join ','))){echo hellno}