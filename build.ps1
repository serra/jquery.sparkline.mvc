Param($path = "output")

New-Item -ItemType d -Force $path -ErrorAction SilentlyContinue
.nuget\nuget.exe pack src\jquery-sparkline-mvc.nuspec -o $path
$o= resolve-path $path

"To test these packages add a nuget source (in visual studio) to:"
"$o" 
" "