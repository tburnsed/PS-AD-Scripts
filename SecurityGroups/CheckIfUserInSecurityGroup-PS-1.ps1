$users = Import-CSV "FILEPATH" | select -expandproperty users

foreach ($user in $users) {
    $secgroup = 'NAME-OF-SECUIRTY-GROUP'
    $members = Get-ADGroupMember -Identity $secgroup -Recursive | Select -ExpandProperty name

    If ($members -contains $user) {
        Write-Host $user is a member of $secgroup -ForegroundColor green
    } Else {
        Write-Host $user is not a member of $secgroup -ForegroudColor red
    }
}