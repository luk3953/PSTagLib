function Get-AudioTag {
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline
        )]
        [AudioFile] $AudioFile,

        [string] $Name
    )
    begin {
        if ($name -and -not $script:TagTypeMap.ContainsKey($Name)) {
            throw "the value not in tagtypemap. The options are $($script:TagTypeMap)"
        }
    }

    process {
        if ($Name) {
            $AudioFile.fileTags.$Name
        } else {
            $AudioFile.fileTags
        } 
    }
}