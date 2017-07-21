
Copy-Item -Path '\\state.in.us\file1\iot\home\3-imager\2017-05 Cumulative Update for Windows 10 Version 1607 for x64-based Systems (KB4023680)\AMD64-all-windows10.0-kb4023680-x64_de5502ce899738bedd5eb20f10cfe67ea26ff5b6.msu' -Destination c:\
Start-Process -FilePath 'wusa.exe' -ArgumentList 'C:\AMD64-all-windows10.0-kb4023680-x64_de5502ce899738bedd5eb20f10cfe67ea26ff5b6.msu /installsdf /quiet /forcerestart'


