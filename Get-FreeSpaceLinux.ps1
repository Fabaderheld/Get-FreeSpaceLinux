<#
.SYNOPSIS
   Quick and dirty implementation of a df in powershell in linux
.DESCRIPTION
   Long description
.EXAMPLE
   PS C:\> ./Get-FreeSpaceLinux.ps1 -HumanReadable | Format-Table
   Outputs df -h as objects instead of a string as df does
.PARAMETER HumanReadable
   Outputs in human readable format like G or M instead of bytes
#>

[CmdletBinding()]
param (
    [Parameter()]
    [Switch]
    [Alias('h')]
    $HumanReadable
)

if ($HumanReadable) {
    $DFOutput = df -h
}
else {
    $DFOutput = df
}


# Get property keys don't think this is needed
<# $Keys = $DFOutput[0].split()

$FreeSpaceObject = [PSCustomObject]@{
}

foreach ($Key in $Keys) {
    if ($Key -ne "") {
        if ($Key -eq "Mounted") {
            continue
        }
        if ($Key -eq "on") {
            Add-Member -InputObject $FreeSpaceObject -Name "MountedOn" -Value $Null -MemberType NoteProperty
        }
        else {
            Add-Member -InputObject $FreeSpaceObject -Name $Key -Value $Null -MemberType NoteProperty
        }

    }
} #>

$Result = New-Object collections.generic.list[object]

foreach ($Line in $DFOutput[1..($DFOutput.length - 1)]) {

    $Values = ($Line -replace '\s+', ' ').split(" ")
    $Result += [PSCustomObject]@{
        Filesystem  = [string]$Values[0]
        "1K-blocks" = [long]$Values[1]
        Used        = [long]$Values[2]
        Available   = [long]$Values[3]
        "Use%"      = [string]$Values[4]
        MountedOn   = [string]$Values[5]
    }
}

$Result