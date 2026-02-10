function Set-AudioFileLyrics {
    [CmdletBinding()]
    param(
        [ValidateSet("unsynced","synced")]
        [string]$Mode,
        [Parameter(Mandatory, ValueFromPipeline)]
        [AudioFile]$AudioFile
    )

    process {
        if (-not $AudioFile.Lyrics) {
            throw "No staged lyrics found."
        }

        $AudioFile.SetLyrics($Mode)
    }
}