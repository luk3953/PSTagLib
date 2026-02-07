function Get-AudioTag {
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline
        )]
        [AudioFile] $AudioFile,

        [Parameter(Mandatory)]
        [string] $Name
    )
    begin {
        if (-not $script:TagTypeMap.ContainsKey($Name)) {
            throw "the value not in tagtypemap. The options are $($script:TagTypeMap)"
        }
    }

    process {

        $AudioFile.fileTags.$Name
    }
}