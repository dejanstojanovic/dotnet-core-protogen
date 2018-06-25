Param(    
[Parameter(Mandatory=$true)]    
[string]$protoFolder
[Parameter(Mandatory=$true)]    
[string]$modelFolder
[Parameter(Mandatory=$true)]    
[string]$namespace
 )
 

$protoFiles = get-childitem $protoFolder -recurse -force -include *.proto   
foreach($protoFile in $protoFiles){     

	Write-Output $protoFile

	#exec "dotnet protogen.dll " + $protoFile.Name + " --proto_path=" + $protoFolder + " --csharp_out="+$modelFolder+" --package=" + $namespace +"Models"

}