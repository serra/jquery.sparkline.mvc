param($installPath, $toolsPath, $package, $project)

$proj = $project

$globalasax = $null
try
{
    $globalasax = $proj.ProjectItems.Item("global.asax")
}
catch {
    
}

if($globalasax -ne $null) {
    try{
    	$mvcapp = $globalasax.ProjectItems.Item("global.asax.cs").FileCodeModel.CodeElements | where-object {$_.Kind -eq 5}

    			$startup = $mvcapp.Children.Item(1).Members | Where-object {$_.Name -eq 'Application_Start'}
    			if($startup -ne $null) 
    			{	
    				$editpoint=$startup.EndPoint.CreateEditPoint()
    				$editpoint.LineUp(1)
    				$editpoint.EndOfLine()
    				$editpoint.InsertNewLine()
    				$editpoint.Insert("            // register sparkline bundle here")
                }
    }
    catch{
        "Error adding bundle config call to the Application_Start"|out-default
        $_.Exception.ToString()| out-default
   }
}





