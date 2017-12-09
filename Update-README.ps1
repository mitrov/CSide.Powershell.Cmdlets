Import-Module UncommonSense.Nav.Automation -Force -Verbose

Get-Command `
    -Module UncommonSense.Nav.Automation | `
    Sort-Object -Property Noun,Verb | `
        Get-HelpAsMarkDown `
            -Title UncommonSense.Nav.Automation `
            -Description 'PowerShell utils for Microsoft Dynamics NAV' `
            -PrefacePath (Join-Path -Path $PSScriptRoot -ChildPath PREFACE.md) `
            -PostfacePath (Join-Path -Path $PSScriptRoot -ChildPath POSTFACE.md) |`
                Out-File -FilePath (Join-Path -Path $PSScriptRoot -ChildPath README.md) -Encoding utf8