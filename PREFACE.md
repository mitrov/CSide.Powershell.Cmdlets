
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