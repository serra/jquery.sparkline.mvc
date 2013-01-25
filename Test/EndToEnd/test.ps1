&{
    push-location
    md output -ErrorAction SilentlyContinue
    $outdir = resolve-path .\output
    $templates = resolve-path .\projecttemplates
    $source = resolve-path ..\..\output
    . .\utility.ps1
    . .\vs.ps1 $outdir $templates
    close-solution
    $p = new-mvcapplication foobar
    install-package Newtonsoft.Json     # confirm access to NuGet
    install-package jquery.sparkline.mvc4 -source $source
    build-project $p    
    pop-location
	#$dte.ExecuteCommand("debug.start")
}

