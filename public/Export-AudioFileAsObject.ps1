function Export-AudioFileAsObject {
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline
        )]
        [AudioFile] $AudioFile
    )

    process {

        $tags = $AudioFile.FileTags

        $album = $tags.Album
        $title = $tags.Title
        $track = [int]$tags.Track

        $identity = "$($album.ToLower().Trim())|$track|$($title.ToLower().Trim())"

        $bytes = [System.Text.Encoding]::UTF8.GetBytes($identity)
        $hashBytes = [System.Security.Cryptography.SHA256]::Create().ComputeHash($bytes)
        $id = -join ($hashBytes | ForEach-Object { $_.ToString("x2") })

        @{
            _id = $id

            title        = $title
            album        = $album
            track        = $track
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