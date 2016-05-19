<#
.SYNOPSIS
A NAV-aware Select-String; finds a given regular expression in a NAV text export. 

.EXAMPLE
Find-InNAVApplicationObject -Path .\test.txt -Pattern 'DataCaptionFields=([^;]*);' -TrimLine

FileName     : C:\test.txt
FileLineNo   : 11
ObjectType   : Table
ObjectID     : 3
ObjectName   : Payment Terms
ObjectLineNo : 11
Section      : PROPERTIES
Matches      : {Code,Description}
Line         : DataCaptionFields=Code,Description;

FileName     : C:\test.txt
FileLineNo   : 494
ObjectType   : Table
ObjectID     : 5
ObjectName   : Finance Charge Terms
ObjectLineNo : 11
Section      : PROPERTIES
Matches      : {Code,Description}
Line         : DataCaptionFields=Code,Description;

FileName     : C:\test.txt
FileLineNo   : 806
ObjectType   : Table
ObjectID     : 10
ObjectName   : Shipment Method
ObjectLineNo : 11
Section      : PROPERTIES
Matches      : {Code,Description}
Line         : DataCaptionFields=Code,Description;
#>
function Find-InNAVApplicationObject
{
    param
    (
        # The files that you want to search
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [Alias('FullName')]
        [string[]]
        $Path,

        # The pattern that you want to match
        [Parameter(Mandatory)]
        $Pattern,

        # If true, trims the Line property of the resulting objects
        [switch]
        $TrimLine
    )

    Process
    {
        $Properties = [Ordered]@{}

        foreach($File in ($Path | Get-Item))
        {
            $Properties.FileName = $File.FullName
            $Properties.FileLineNo = 0
            $Properties.ObjectType = ''
            $Properties.ObjectID = ''
            $Properties.ObjectName = ''
            $Properties.ObjectLineNo = 0
            $Properties.Section = ''

            $StreamReader = New-Object -TypeName System.IO.StreamReader -ArgumentList $File

            try
            {
                while(-not $StreamReader.EndOfStream)
                {
                    $Line = $StreamReader.ReadLine()

                    if ($Line -match '^OBJECT\s(\w+)\s(\d+)\s(.*)$') 
                    {
                        $Properties.ObjectType = $Matches[1]
                        $Properties.ObjectID = $Matches[2]
                        $Properties.ObjectName = $Matches[3]
                        $Properties.ObjectLineNo = 0
                        $Properties.Section = 'SIGNATURE'
                    }
                    elseif ($Line -match '^\s{2}(\w.*)$')
                    {
                        $Properties.Section = $Matches[1]
                    }

                    $Properties.FileLineNo += 1
                    $Properties.ObjectLineNo += 1

                    if ($Line -match $Pattern)
                    {
                        $Properties.Matches = $Matches[1..($Matches.Count - 1)]
                        $Properties.Line = if ($TrimLine) { $Line.Trim() } else { $Line }
                        [PSCustomObject]$Properties                        
                    }
                }
            }
            finally
            {
                $StreamReader.Close()
            }
        }
    }
}



