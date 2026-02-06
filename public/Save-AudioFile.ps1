function Save-AudioFile {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline
        )]
        [AudioFile]$AudioFile
    )

    process {
        $AudioFile.Save()
        $AudioFile 
    }
}