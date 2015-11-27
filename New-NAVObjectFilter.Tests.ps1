Describe 'New-NAVObjectFilter' {
    It 'Returns an empty string if no parameters are specified' {
        New-NAVObjectFilter | Should Be ''
    }

    It 'Returns a Type filter if some object types are specified' {
        New-NAVObjectFilter -Table -Page -Codeunit | Should Be 'Type=Table|Page|Codeunit'
    }

    It 'Returns an empty Type filter is all object types are specified' {
        New-NAVObjectFilter -Table -Page -Codeunit -Report -MenuSuite -XmlPort -Query | Should Be ''
    }

    It 'Summarizes unsorted ID filter' {
        New-NAVObjectFilter -ID 50000, 50001, 50002, 50005, 50007, 50003, 50006, 50010 | Should Be 'ID=50000..50003|50005..50007|50010'
    }

    It 'Returns a Name filter' {
        New-NAVObjectFilter -Name ABCD | Should Be 'Name=ABCD'
    }

    It 'Returns a Caption filter' {
        New-NAVObjectFilter -Caption ABCD | Should Be 'Caption=ABCD'
    }

    It 'Returns a Modified filter' {
        New-NAVObjectFilter -Modified $true | Should Be 'Modified=yes'
        New-NAVObjectFilter -Modified $false | Should Be 'Modified=no'
    }

    It 'Returns a Compiled filter' {
        New-NAVObjectFilter -Compiled $true | Should Be 'Compiled=yes'
        New-NAVObjectFilter -Compiled $false | Should Be 'Compiled=no'
    }

    It 'Returns a Date filter' {
        New-NAVObjectFilter -Date (Get-Date -Year 2015 -Month 1 -Day 1) | Should Be "Date=$(Get-Date -Year 2015 -Month 1 -Day 1 -Format d)"
    }

    It 'Returns a Time filter' {
        New-NAVObjectFilter -Time (Get-Date -Hour 8 -Minute 30 -Second 5) | Should Be "Time=$(Get-Date -Hour 8 -Minute 30 -Second 5 -Format T)"
    }

    It 'Returns a VersionList filter' {
        New-NAVObjectFilter -VersionList 'Foo' | Should Be 'Version List=Foo'
    }

    It 'Returns a Locked filter' {
        New-NAVObjectFilter -Locked $true | Should Be 'Locked=yes'
        New-NAVObjectFilter -Locked $false | Should Be 'Locked=no'
    }

    It 'Returns a LockedBy filter' {
        New-NAVObjectFilter -LockedBy 'EUROPE\jhoek' | Should Be 'Locked By=EUROPE\jhoek'
    }
}