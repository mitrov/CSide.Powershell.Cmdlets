<#
.Synopsis
   Builds a filter to be used with Export-NAVApplicationObject and Compile-NAVApplicationObject
#>
function New-NAVObjectFilter
{
    [CmdletBinding()]
    Param
    (
        [Switch]$Table,
        [Switch]$Page,
        [Switch]$Codeunit,
        [Switch]$Report,
        [Switch]$XmlPort,
        [Switch]$Query,
        [Switch]$MenuSuite,

        [int[]]$ID,

        [string]$Name,

        [string]$Caption,

        [bool]$Modified,

        [bool]$Compiled,

        [DateTime]$Date,

        [DateTime]$Time,

        [string]$VersionList,

        [bool]$Locked,

        [string]$LockedBy
    )

    $Filters = [Ordered]@{}

    $Types = @()
    if ($Table) { $Types += 'Table' }
    if ($Page) { $Types += 'Page' }
    if ($Report) { $Types += 'Report' }
    if ($Codeunit) { $Types += 'Codeunit' }
    if ($XmlPort) { $Types += 'XMLport' }
    if ($Query) { $Types += 'Query' }
    if ($MenuSuite) { $Types += 'MenuSuite' }

    if (1..6 -contains $Types.Length)
    {
        $Filters.Type = ($Types -join '|')
    }

    if ($ID)
    {
        $Filters.ID = SummarizeRanges -Values $ID
    }

    if ($Name)
    {
        $Filters.Name = $Name
    }

    if ($Caption)
    {
        $Filters.Caption = $Caption
    }

    if ($PSBoundParameters.ContainsKey('Modified'))
    {
        $Filters.Modified = if ($Modified) { 'yes' } else { 'no' }
    }

    if ($PSBoundParameters.ContainsKey('Compiled'))
    {
        $Filters.Compiled = if ($Compiled) { 'yes' } else { 'no' }
    }

    if ($Date)
    {
        $Filters.Date = '{0:d}' -f $Date
    }

    if ($Time)
    {
        $Filters.Time = '{0:T}' -f $Time
    }

    if ($VersionList)
    {
        $Filters.'Version List' = $VersionList
    }

    if ($PSBoundParameters.ContainsKey('Locked'))
    {
        $Filters.Locked = if ($Locked) { 'yes' } else { 'no' }
    }

    if ($LockedBy)
    {
        $Filters.'Locked By' = $LockedBy
    }

    ($Filters.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" }) -join ';'
}

function SummarizeRanges
{
    Param
    (
        [int[]]$Values
    )

    $SortedValues = $Values | Sort-Object
    $IndexedValues = [Ordered]@{}

    for($Index = 0; $Index -lt $SortedValues.Length; $Index++)
    {
        $IndexedValues.Add($SortedValues[$Index], $SortedValues[$Index] - $Index)
    }

    $GroupedValues = $IndexedValues.GetEnumerator() | Group-Object -Property Value
    $Ranges = @()

    foreach($GroupedValue in $GroupedValues)
    {
        $First = $GroupedValue.Group | Select-Object -First 1 -ExpandProperty Name
        $Last = $GroupedValue.Group | Select-Object -Last 1 -ExpandProperty Name
        $Ranges += if ($First -eq $Last) { "$First" } else { "$First..$Last" }
    }

    $Ranges -join '|'
}

New-NAVObjectFilter -Table -Page -Report -Codeunit -MenuSuite -XmlPort -ID 50000, 50001, 50002, 50005, 50006 -Name Foo*Baz -Caption Blaat -Compiled $true -Date (Get-Date) -Time 23:01:05 -VersionList OinkBoink1.00 -Locked $true