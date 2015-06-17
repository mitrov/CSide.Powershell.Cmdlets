#UncommonSense.Nav.Automation
PowerShell utils for Microsoft Dynamics NAV
###Notes
These functions support virtually all NAV versions - even versions that don't have native PowerShell or CLI (command line interface) support. Due to the technology used, the functions will only work in 32-bit (x86) PowerShell environments.

###Installation
Clone the files to a folder called UncommonSense.Nav.Automation in your module path (typically `C:\Users\{username}\Documents\WindowsPowerShell\Modules`) to make them instantly available in any PowerShell session.
##Index
- [Compile-NAVApplicationObject](#Compile-NAVApplicationObject)
- [Export-NAVApplicationObject](#Export-NAVApplicationObject)
- [Import-NAVApplicationObject](#Import-NAVApplicationObject)
- [Get-NAVApplicationObjectInfo](#Get-NAVApplicationObjectInfo)
- [Start-NAVDebugger](#Start-NAVDebugger)
- [Get-NAVDevelopmentClient](#Get-NAVDevelopmentClient)
- [Start-NAVDevelopmentClient](#Start-NAVDevelopmentClient)

<a name="Compile-NAVApplicationObject"></a>
##Compile-NAVApplicationObject
###Synopsis
Compiles a NAV application object
###Syntax
```powershell
Compile-NAVApplicationObject [[-DatabaseServerType] <String>] [-DatabaseName] <String> [[-DatabaseServer] <String>] [-Type] <String> [-ID] <Int32> [<CommonParameters>]
```
###Parameters
####DatabaseServerType &lt;String&gt;
    Specifies the type of server to connect to (native or Microsoft SQL Server)
    
    Required?                    false
    Position?                    1
    Default value                SQL
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
####DatabaseName &lt;String&gt;
    Specifies the name of the database from which you want to export.
    
    Required?                    true
    Position?                    2
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
####DatabaseServer &lt;String&gt;
    Specifies the name of the SQL server instance to which the database
    you want to export from is attached. The default value is the default
    instance on the local host (.).
    
    Required?                    false
    Position?                    3
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
####Type &lt;String&gt;
    Specifies the type of the object to export
    
    Required?                    true
    Position?                    4
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
####ID &lt;Int32&gt;
    Specifies the ID of the object to export
    
    Required?                    true
    Position?                    5
    Default value                0
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
<a name="Export-NAVApplicationObject"></a>
##Export-NAVApplicationObject
###Synopsis
Exports a NAV object to a disk file.
###Syntax
```powershell
Export-NAVApplicationObject [[-DatabaseServerType] <String>] [-DatabaseName] <String> [-DatabaseServer] <String> [-Path] <String> [-Type] <String> [-ID] <Int32> [-Force] [<CommonParameters>]
```
###Parameters
####DatabaseServerType &lt;String&gt;
    Specifies the type of server to connect to (native or Microsoft SQL Server)
    
    Required?                    false
    Position?                    1
    Default value                SQL
    Accept pipeline input?       false
    Accept wildcard characters?  false
####DatabaseName &lt;String&gt;
    Specifies the name of the database from which you want to export.
    
    Required?                    true
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####DatabaseServer &lt;String&gt;
    Specifies the name of the SQL server instance to which the database
    you want to export from is attached.
    
    Required?                    true
    Position?                    3
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####Path &lt;String&gt;
    Specifies the folder to export to.
    
    Required?                    true
    Position?                    4
    Default value                $Pwd
    Accept pipeline input?       false
    Accept wildcard characters?  false
####Type &lt;String&gt;
    Specifies the type of the object to export
    
    Required?                    true
    Position?                    5
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
####ID &lt;Int32&gt;
    Specifies the ID of the object to export
    
    Required?                    true
    Position?                    6
    Default value                0
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
####Force [&lt;SwitchParameter&gt;]
    
    Required?                    false
    Position?                    named
    Default value                False
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Import-NAVApplicationObject"></a>
##Import-NAVApplicationObject
###Synopsis
Imports NAV objects from a disk file.
###Syntax
```powershell
Import-NAVApplicationObject [[-DatabaseServerType] <String>] [[-DatabaseName] <String>] [[-DatabaseServer] <String>] [-Path] <String> [<CommonParameters>]
```
###Parameters
####DatabaseServerType &lt;String&gt;
    Specifies the type of server to connect to (native or Microsoft SQL Server)
    
    Required?                    false
    Position?                    1
    Default value                SQL
    Accept pipeline input?       false
    Accept wildcard characters?  false
####DatabaseName &lt;String&gt;
    Specifies the name of the database from which you want to export.
    
    Required?                    false
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####DatabaseServer &lt;String&gt;
    Specifies the name of the database server (instance) to which the database you want to import to is attached.
    
    Required?                    false
    Position?                    3
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####Path &lt;String&gt;
    Specifies the file name to import
    
    Required?                    true
    Position?                    4
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Get-NAVApplicationObjectInfo"></a>
##Get-NAVApplicationObjectInfo
###Synopsis
Retrieves information about NAV objects that match the optional filter criteria
###Syntax
```powershell
Get-NAVApplicationObjectInfo [[-DatabaseServerType] <String>] [-DatabaseServer] <String> [-DatabaseName] <String> [[-TypeFilter] <String>] [[-IDFilter] <String>] [[-NameFilter] <String>] [[-ModifiedFilter] <String>] [[-CompiledFilter] <String>] [[-DateFilter] <String>] [[-TimeFilter] <String>] [[-VersionListFilter] <String>] [<CommonParameters>]
```
###Parameters
####DatabaseServerType &lt;String&gt;
    Type of server to connect to (native or Microsoft SQL Server)
    
    Required?                    false
    Position?                    1
    Default value                SQL
    Accept pipeline input?       false
    Accept wildcard characters?  false
####DatabaseServer &lt;String&gt;
    Name of the server to connect to
    
    Required?                    true
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####DatabaseName &lt;String&gt;
    Name of the database to open
    
    Required?                    true
    Position?                    3
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####TypeFilter &lt;String&gt;
    Filters
    
    Required?                    false
    Position?                    4
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####IDFilter &lt;String&gt;
    
    Required?                    false
    Position?                    5
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####NameFilter &lt;String&gt;
    
    Required?                    false
    Position?                    6
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####ModifiedFilter &lt;String&gt;
    
    Required?                    false
    Position?                    7
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####CompiledFilter &lt;String&gt;
    
    Required?                    false
    Position?                    8
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####DateFilter &lt;String&gt;
    
    Required?                    false
    Position?                    9
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####TimeFilter &lt;String&gt;
    
    Required?                    false
    Position?                    10
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####VersionListFilter &lt;String&gt;
    
    Required?                    false
    Position?                    11
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Start-NAVDebugger"></a>
##Start-NAVDebugger
###Synopsis
Starts the NAV Debugger
###Description
This function opens the session list window in the selected NAV client. From the session list, you can select a session to debug.
Configurations are taken from a comma-separated (csv) file called `clients.txt` in the module folder. Each line in the file represents a single configuration, and
consists of the following values:

- ID: a unique ID for each configuration; this is the value you specify for the -Config parameter.
- ClientExePath: the full path (including the file name) to the Microsoft Dynamics NAV Role Tailored Client.
- ServerName: the name of the computer on which the Microsoft Dynamics NAV Service Tier is running.
- PortNo: the port number that the Microsoft Dynamics NAV Service Tier is listening to.
- ServiceInstanceName: the name of the Microsoft Dynamics NAV Service Tier instance.
- CompanyName: the name of the company to use during debugging.

###Syntax
```powershell
Start-NAVDebugger [<CommonParameters>]
```
###Parameters
<a name="Get-NAVDevelopmentClient"></a>
##Get-NAVDevelopmentClient
###Synopsis
Retrieves a client object that represents a running Microsoft Dynamics NAV development client, 
or a list of all running Microsoft Dynamics NAV development clients.
###Syntax
```powershell
Get-NAVDevelopmentClient [-DatabaseServerType <String>] -DatabaseServer <String> -DatabaseName <String> [<CommonParameters>]
Get-NAVDevelopmentClient -List [<CommonParameters>]
```
###Parameters
####DatabaseServerType &lt;String&gt;
    Type of server to connect to (native or Microsoft SQL Server)
    
    Required?                    false
    Position?                    named
    Default value                SQL
    Accept pipeline input?       false
    Accept wildcard characters?  false
####DatabaseServer &lt;String&gt;
    Name of the server to connect to
    
    Required?                    true
    Position?                    named
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####DatabaseName &lt;String&gt;
    Name of the database to open
    
    Required?                    true
    Position?                    named
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####List [&lt;SwitchParameter&gt;]
    List the running development clients
    
    Required?                    true
    Position?                    named
    Default value                False
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Start-NAVDevelopmentClient"></a>
##Start-NAVDevelopmentClient
###Synopsis
Starts a NAV Development client
###Syntax
```powershell
Start-NAVDevelopmentClient [-DevEnvFilePath] <String> [-DatabaseServerName] <String> [-DatabaseName] <String> [[-WindowStyle] <String>] [[-ID] <String>] [-PassThru] [<CommonParameters>]
```
###Parameters
####DevEnvFilePath &lt;String&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####DatabaseServerName &lt;String&gt;
    
    Required?                    true
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####DatabaseName &lt;String&gt;
    
    Required?                    true
    Position?                    3
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####WindowStyle &lt;String&gt;
    
    Required?                    false
    Position?                    4
    Default value                Normal
    Accept pipeline input?       false
    Accept wildcard characters?  false
####ID &lt;String&gt;
    
    Required?                    false
    Position?                    5
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
####PassThru [&lt;SwitchParameter&gt;]
    
    Required?                    false
    Position?                    named
    Default value                False
    Accept pipeline input?       false
    Accept wildcard characters?  false
###License
This project is licensed under the Apache 2.0 License. Please refer to LICENSE.md for more information.

###Acknowledgements
These functions use the CSide Integration Utilities library written by Thaddeus Ryker, licensed under the Apache 2.0 License. The source is obtainable at http://code.edgerunner.org/dynamics-nav-client-interface-library. 
