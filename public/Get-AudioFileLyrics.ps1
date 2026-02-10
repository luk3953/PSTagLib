function Get-AudioFileLyrics {
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline
        )]
        [AudioFile] $AudioFile
    )

    process {

        $tags = get-audiotag $AudioFile

        $trackName = $tags.Title.Split(" ") -join("+")
        $artistName = $tags.AlbumArtists.Split(" ") -join ("+")
        $albumName = $tags.Album.Split(" ") -join ("+")
        $duration = [Math]::Floor($AudioFile.file.Properties.Duration.Totalseconds)

        $endpoint = "https://lrclib.net/api/get?artist_name=$artistName&track_name=$trackName&album_name=$albumName&duration=$duration"

        $response = (invoke-webrequest -method GET -uri $endpoint).content | convertfrom-json

        $AudioFile.Lyrics = [Lyrics]@{
            Plain  = $response.plainLyrics
            Synced = $response.syncedLyrics
            Id     = $response.id
            Source = 'LrcLib.net'
        }

        $AudioFile

        }
    }
