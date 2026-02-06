function New-AudioFile {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [Alias('FullName')]
        [string]$Path
    )

    process {
        [AudioFile]::new($Path)
    }
}