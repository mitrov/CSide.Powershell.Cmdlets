# UncommonSense.Nav.Automation
PowerShell utils for Microsoft Dynamics NAV
[![Join the chat at https://gitter.im/jhoek/UncommonSense.Nav.Automation](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/jhoek/UncommonSense.Nav.Automation?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

### Notes
These functions support virtually all NAV versions - even versions that don't have native PowerShell or CLI (command line interface) support. Due to the technology used, the functions will only work in 32-bit (x86) PowerShell environments.

### Installation
Clone the files to a folder called UncommonSense.Nav.Automation in your module path (typically `C:\Users\{username}\Documents\WindowsPowerShell\Modules`) to make them instantly available in any PowerShell session.

### Typical usage scenario
A typical usage scenario would involve starting up a development client using settings from a predefined database connection configuration, and issuing a number of commands against that client before closing it again. 

```powershell
$ClientInfo = Get-NAVDatabaseConnectionConfig -Name CRONUSW12015 | Start-NAVDevelopmentCl
ient -PassThru
$Objects = $ClientInfo | Get-NAVApplicationObjectInfo -TypeFilter Table -IDFilter ..10
$Objects | Export-NAVApplicationObject -Path $Home\Desktop -Client $ClientInfo.Client
$ClientInfo | Stop-NAVDevelopmentClient
```
## Index
| Command | Synopsis |
| ------- | -------- |
| [Compile-NAVApplicationObject](#Compile-NAVApplicationObject) | Compiles a NAV application object |
| [Export-NAVApplicationObject](#Export-NAVApplicationObject) | Exports a NAV object to a disk file. |
| [Import-NAVApplicationObject](#Import-NAVApplicationObject) | Imports NAV objects from a disk file. |
| [Get-NAVApplicationObjectInfo](#Get-NAVApplicationObjectInfo) | Retrieves information about NAV objects that match the optional filter criteria |
| [Get-NAVDatabaseConnectionConfig](#Get-NAVDatabaseConnectionConfig) | Retrieves a (list of) predefined NAV database configuration(s). |
| [Start-NAVDebugger](#Start-NAVDebugger) | Starts the NAV Debugger |
| [Get-NAVDevelopmentClient](#Get-NAVDevelopmentClient) | Retrieves a client object that represents a running Microsoft Dynamics NAV development client,  or a list of all running Microsoft Dynamics NAV development clients. |
| [Start-NAVDevelopmentClient](#Start-NAVDevelopmentClient) | Starts a NAV development client. |
| [Stop-NAVDevelopmentClient](#Stop-NAVDevelopmentClient) | Stops a running NAV development client. |
| [Get-NAVDevelopmentClientConfig](#Get-NAVDevelopmentClientConfig) | Retrieves a (list of) predefined NAV development client configuration(s). |

<a name="Compile-NAVApplicationObject"></a>
## Compile-NAVApplicationObject
### Synopsis
Compiles a NAV application object
### Syntax
```powershell
Compile-NAVApplicationObject [-Client] <Client> [-Type] <string> [-ID] <int> [<CommonParameters>]
```
### Parameters
#### Client &lt;Client&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       true (ByValue, ByPropertyName)
    Accept wildcard characters?  false
#### Type &lt;String&gt;
    Specifies the type of the object to export
    
    Required?                    true
    Position?                    2
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### ID &lt;Int32&gt;
    Specifies the ID of the object to export
    
    Required?                    true
    Position?                    3
    Default value                0
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
<a name="Export-NAVApplicationObject"></a>
## Export-NAVApplicationObject
### Synopsis
Exports a NAV object to a disk file.
### Syntax
```powershell
Export-NAVApplicationObject [-Client] <Client> [-Path] <string> [-Type] <string> [-ID] <int> [[-DateTime] <datetime>] [-ArchiveFileAttribute] [-Force] [<CommonParameters>]
```
### Parameters
#### Client &lt;Client&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       true (ByValue, ByPropertyName)
    Accept wildcard characters?  false
#### Path &lt;String&gt;
    Specifies the folder to export to.
    
    Required?                    true
    Position?                    2
    Default value                $Pwd
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### Type &lt;String&gt;
    Specifies the type of the object to export
    
    Required?                    true
    Position?                    3
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### ID &lt;Int32&gt;
    Specifies the ID of the object to export
    
    Required?                    true
    Position?                    4
    Default value                0
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### DateTime &lt;DateTime&gt;
    Specifies DateTime of the object to export
    
    Required?                    false
    Position?                    5
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### ArchiveFileAttribute [&lt;SwitchParameter&gt;]
    Specifies whether modified objects have the file attribute &#39;Archive&#39;
    
    Required?                    false
    Position?                    named
    Default value                False
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### Force [&lt;SwitchParameter&gt;]
    
    Required?                    false
    Position?                    named
    Default value                False
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Import-NAVApplicationObject"></a>
## Import-NAVApplicationObject
### Synopsis
Imports NAV objects from a disk file.
### Syntax
```powershell
Import-NAVApplicationObject [-Client] <Client> [-Path] <string> [<CommonParameters>]
```
### Parameters
#### Client &lt;Client&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       true (ByValue, ByPropertyName)
    Accept wildcard characters?  false
#### Path &lt;String&gt;
    Specifies the file name to import
    
    Required?                    true
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Get-NAVApplicationObjectInfo"></a>
## Get-NAVApplicationObjectInfo
### Synopsis
Retrieves information about NAV objects that match the optional filter criteria
### Syntax
```powershell
Get-NAVApplicationObjectInfo [-Client] <Client> [[-TypeFilter] <string>] [[-IDFilter] <string>] [[-NameFilter] <string>] [[-ModifiedFilter] <string>] [[-CompiledFilter] <string>] [[-DateFilter] <string>] [[-TimeFilter] <string>] [[-VersionListFilter] <string>] [<CommonParameters>]
```
### Parameters
#### Client &lt;Client&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       true (ByValue, ByPropertyName)
    Accept wildcard characters?  false
#### TypeFilter &lt;String&gt;
    
    Required?                    false
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### IDFilter &lt;String&gt;
    
    Required?                    false
    Position?                    3
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### NameFilter &lt;String&gt;
    
    Required?                    false
    Position?                    4
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### ModifiedFilter &lt;String&gt;
    
    Required?                    false
    Position?                    5
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### CompiledFilter &lt;String&gt;
    
    Required?                    false
    Position?                    6
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### DateFilter &lt;String&gt;
    
    Required?                    false
    Position?                    7
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### TimeFilter &lt;String&gt;
    
    Required?                    false
    Position?                    8
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### VersionListFilter &lt;String&gt;
    
    Required?                    false
    Position?                    9
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Get-NAVDatabaseConnectionConfig"></a>
## Get-NAVDatabaseConnectionConfig
### Synopsis
Retrieves a (list of) predefined NAV database configuration(s).
### Syntax
```powershell
Get-NAVDatabaseConnectionConfig [[-Name] <string>] [<CommonParameters>]
```
### Parameters
#### Name &lt;String&gt;
    
    Required?                    false
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Start-NAVDebugger"></a>
## Start-NAVDebugger
### Synopsis
Starts the NAV Debugger
### Description
This function opens the session list window in the selected NAV client. From the session list, you can select a session to debug.
Configurations are taken from a comma-separated (csv) file called `clients.txt` in the module folder. Each line in the file represents a single configuration, and
consists of the following values:

- ID: a unique ID for each configuration; this is the value you specify for the -Config parameter.
- ClientExePath: the full path (including the file name) to the Microsoft Dynamics NAV Role Tailored Client.
- ServerName: the name of the computer on which the Microsoft Dynamics NAV Service Tier is running.
- PortNo: the port number that the Microsoft Dynamics NAV Service Tier is listening to.
- ServiceInstanceName: the name of the Microsoft Dynamics NAV Service Tier instance.
- CompanyName: the name of the company to use during debugging.

### Syntax
```powershell
Start-NAVDebugger -Config <string> [<CommonParameters>]
```
### Parameters
<a name="Get-NAVDevelopmentClient"></a>
## Get-NAVDevelopmentClient
### Synopsis
Retrieves a client object that represents a running Microsoft Dynamics NAV development client, 
or a list of all running Microsoft Dynamics NAV development clients.
### Syntax
```powershell
Get-NAVDevelopmentClient [[-DatabaseServerTypeFilter] <string>] [[-DatabaseServerNameFilter] <string>] [[-DatabaseNameFilter] <string>] [-List] [<CommonParameters>]
```
### Parameters
#### DatabaseServerTypeFilter &lt;String&gt;
    Filters running clients by server type
    
    Required?                    false
    Position?                    1
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### DatabaseServerNameFilter &lt;String&gt;
    Filters running clients by server name
    
    Required?                    false
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### DatabaseNameFilter &lt;String&gt;
    Filters running clients by database name
    
    Required?                    false
    Position?                    3
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### List [&lt;SwitchParameter&gt;]
    Return all running development clients, instead of only the first match
    
    Required?                    false
    Position?                    named
    Default value                False
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Start-NAVDevelopmentClient"></a>
## Start-NAVDevelopmentClient
### Synopsis
Starts a NAV development client.
### Syntax
```powershell
Start-NAVDevelopmentClient [-DevClientPath] <string> [-DatabaseServerType] <string> [[-DatabaseServerName] <string>] [[-DatabaseName] <string>] [[-ZupPath] <string>] [[-NTAuthentication] <string>] [[-NetType] <string>] [[-WindowStyle] <string>] [-PassThru] [<CommonParameters>]
```
### Parameters
#### DevClientPath &lt;String&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### DatabaseServerType &lt;String&gt;
    
    Required?                    true
    Position?                    2
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### DatabaseServerName &lt;String&gt;
    
    Required?                    false
    Position?                    3
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### DatabaseName &lt;String&gt;
    
    Required?                    false
    Position?                    4
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### ZupPath &lt;String&gt;
    
    Required?                    false
    Position?                    5
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### NTAuthentication &lt;String&gt;
    
    Required?                    false
    Position?                    6
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### NetType &lt;String&gt;
    
    Required?                    false
    Position?                    7
    Default value                
    Accept pipeline input?       true (ByPropertyName)
    Accept wildcard characters?  false
#### WindowStyle &lt;String&gt;
    Controls how the development client window is displayed
    
    Required?                    false
    Position?                    8
    Default value                Normal
    Accept pipeline input?       false
    Accept wildcard characters?  false
#### PassThru [&lt;SwitchParameter&gt;]
    
    Required?                    false
    Position?                    named
    Default value                False
    Accept pipeline input?       false
    Accept wildcard characters?  false
<a name="Stop-NAVDevelopmentClient"></a>
## Stop-NAVDevelopmentClient
### Synopsis
Stops a running NAV development client.
### Syntax
```powershell
Stop-NAVDevelopmentClient [-Client] <Client> [<CommonParameters>]
```
### Parameters
#### Client &lt;Client&gt;
    
    Required?                    true
    Position?                    1
    Default value                
    Accept pipeline input?       true (ByValue, ByPropertyName)
    Accept wildcard characters?  false
<a name="Get-NAVDevelopmentClientConfig"></a>
## Get-NAVDevelopmentClientConfig
### Synopsis
Retrieves a (list of) predefined NAV development client configuration(s).
### Syntax
```powershell
Get-NAVDevelopmentClientConfig [[-Name] <string>] [<CommonParameters>]
```
### Parameters
#### Name &lt;String&gt;
    
    Required?                    false
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false
###License
This project is licensed under the Apache 2.0 License. Please refer to LICENSE.md for more information.

###Acknowledgements
These functions use the CSide Integration Utilities library written by Thaddeus Ryker, licensed under the Apache 2.0 License. The source is obtainable at http://code.edgerunner.org/dynamics-nav-client-interface-library. 

Dynamics Nav is a registered trademark of the Microsoft Corporation.
<div style='font-size:small; color: #ccc'>Generated 03-11-2015 08:17:21</div>
