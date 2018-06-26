Param(
[Parameter(Mandatory=$true)]    
$protogenPath,
[Parameter(Mandatory=$true)]    
[string]$protoFolder,
[Parameter(Mandatory=$true)]    
[string]$modelFolder,
[Parameter(Mandatory=$true)]    
[string]$namespace
 )
 
  
#$protogenPath = "D:\Github\dotnet-core-protogen\tools\protogen\protogen.dll"
#$protoFolder = "D:\Github\dotnet-core-protogen\Protobuf.Autogenerate.Sample\Protos"
#$modelFolder = "D:\Github\dotnet-core-protogen\Protobuf.Autogenerate.Sample\Models"
#$namespace = "Protobuf.Autogenerate.Sample.Models"

$protoFiles = get-childitem $protoFolder -recurse -force -include *.proto   
foreach($protoFile in $protoFiles){

    $outFilePath = $modelFolder + "\" + $protoFile.Name

    if(!Test-Path($outFilePath)){

        $protoPathParam = "--proto_path=" + $protoFolder
        $csharpOutParam = "--csharp_out=" + $modelFolder
        $packageParam = "--package=" + $namespace +".Models"

	    Start-Process -FilePath "dotnet" -ArgumentList $protogenPath , $protoFile.Name, $protoPathParam , $csharpOutParam , $packageParam
    }

}