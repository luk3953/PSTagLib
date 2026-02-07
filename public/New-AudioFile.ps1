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

        if (($Path.split('.'))[-1] -notin $script:tagLibFileTypes) {
            Write-Warning "File type not supported. Skipping path $Path"
            return
        }

        return [AudioFile]::new($Path)
    }
}