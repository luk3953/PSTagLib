function Export-AudioFileAsObject {
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline
        )]
        [AudioFile] $AudioFile
    )

    process {

        $tags = get-audiotag -AudioFile $AudioFile

        @{

            title        = $tags.Title
            track        = [int]$tags.Track
            duration     = [int][Math]::Floor($AudioFile.File.Properties.Duration.TotalSeconds)
            year         = [int]$tags.Year

            artists      = @($tags.Artists)
            albumArtists = @($tags.AlbumArtists)
            genres       = @($tags.Genres)

            playCount    = 0
            rating       = $null

            migration = @{
                location     = "Host"
                lastMove     = $null
                migrated     = $false
                migrationJob = $null
            }

            addedAt = Get-Date
        }



    }
}