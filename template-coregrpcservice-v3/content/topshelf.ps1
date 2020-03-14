$Path = Split-Path -Parent $MyInvocation.MyCommand.Definition;
$Path = "$Path\src"
$Prefix = "Overt.GrpcTemplate"

Get-ChildItem $Path -Recurse | ForEach-Object -Process {
    # �޸�csproj�ļ�
    if($_ -is [System.IO.FileInfo] -and $_.Name.EndsWith($Prefix + ".Service.csproj")) {
        $content1 = Get-Content $_.FullName

        $match1 = $content1 -cmatch "Topshelf"
        if(!$match1) {
            $content1 -replace '<PackageReference Include="Microsoft.Extensions.Hosting" Version="2.2.0" />', '<PackageReference Include="Microsoft.Extensions.Hosting" Version="2.2.0" />
    <PackageReference Include="Topshelf" Version="4.2.1" />' | Set-Content $_.FullName
        }
    }

    # �޸�.json�ļ�
    if($_ -is [System.IO.FileInfo] -and $_.Name.EndsWith("appsettings.json")) {
        $content = Get-Content $_.FullName

        $match = $content -cmatch "WinService"
        if(!$match) {
            $serviceName = $Prefix.Replace(".", "") + "Service"
            $jsonRepContent = '{
  "WinService": {
    "Name": "'+$serviceName+'",
    "Description": "'+$serviceName+'������Ϣ"
  },'
            $content -replace '^{', $jsonRepContent | Set-Content $_.FullName
        }
    }

    # �޸�Program.cs�ļ�
    if($_ -is [System.IO.FileInfo] -and $_.Name.EndsWith("Program.cs")) {
        $content = Get-Content $_.FullName

        $match = $content -cmatch "HostFactory"
        if(!$match) {
            $content -replace "host.Run\(\);", 'HostFactory.Run(x =>
            {
                var configuration = host.Services.GetService<IConfiguration>();
                var serviceName = configuration.GetValue<string>("WinService:Name");
                var description = configuration.GetValue<string>("WinService:Description");
                x.SetServiceName(serviceName);
                x.SetDisplayName(serviceName);
                x.SetDescription(description);

                x.Service<IHost>(s =>
                {
                    s.ConstructUsing(() => host);
                    s.WhenStarted(service => service.Start());
                    s.WhenStopped(service => service.StopAsync());
                });
            });' -replace "using System;", 'using System;
using Topshelf;' | Set-Content $_.FullName
        }
    }
}