# Get-FreeSpaceLinux.ps1

## SYNOPSIS
Quick and dirty implementation of a df in powershell in linux

## SYNTAX

```
Get-FreeSpaceLinux.ps1 [-HumanReadable] [<CommonParameters>]
```

## DESCRIPTION
Long description

## EXAMPLES

### EXAMPLE 1
```
./Get-FreeSpaceLinux.ps1 -HumanReadable | Format-Table
Outputs df -h as objects instead of a string as df does
```

## PARAMETERS

### -HumanReadable
Outputs in human readable format like G or M instead of bytes

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: h

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
