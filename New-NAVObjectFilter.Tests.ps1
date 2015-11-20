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
}