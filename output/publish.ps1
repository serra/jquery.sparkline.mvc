Param($feed = "http://www.myget.org/F/serraict/api/v2/package")

$packdir = resolve-path .\
$apps = @(Get-ChildItem "$packdir" -recurse -include *.nupkg )
foreach ($app in $apps) {
    ..\.nuget\NuGet.exe push $app `
                        -Source $feed
}
