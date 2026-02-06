function Set-AudioTag {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline
        )]
        [AudioFile] $AudioFile,

        [Parameter(Mandatory)]
        [string] $Name,

        [Parameter(Mandatory)]
        $Value
    )
    begin {

        if (-not $script:TagTypeMap.ContainsKey($Name)) {
            throw "the tag name not in tagtypemap. The options are $($script:TagTypeMap)"
        }


        $ExpectedType = $script:TagTypeMap[$Name]

        if (-not $ExpectedType) {
            throw "Tag '$Name' is not supported."
        }

        if ($ExpectedType -eq [string[]] -and $Value -is [string]) {
            $Value = [string[]]@($Value)
            Write-Verbose "Converted string → string[]"
        }

        if (-not ($Value -is $ExpectedType)) {
            throw "Invalid value type for '$Name'. Expected $ExpectedType, got $($Value.GetType().Name)."
        }
    }

    process {
        $AudioFile.fileTags.$Name = $Value
    }
}