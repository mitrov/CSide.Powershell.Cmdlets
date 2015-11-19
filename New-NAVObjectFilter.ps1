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
        $Filters.ID = $ID -join '|'
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
        $Filters.LockedBy = $LockedBy
    }

    ($Filters.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" }) -join ';'
}

New-NAVObjectFilter -Table -Page -Report -Codeunit -MenuSuite -XmlPort -ID (15..20) -Name Foo*Baz -Caption Blaat -Compiled $true -Date (Get-Date) -Time 23:01:05 -VersionList OinkBoink1.00 -Locked $true