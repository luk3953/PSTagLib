
$script:TagTypeMap = @{
    Title               = [string]
    TitleSort           = [string]
    Album               = [string]
    AlbumSort           = [string]
    Comment             = [string]
    Lyrics              = [string]
    Grouping            = [string]
    Conductor           = [string]
    Copyright           = [string]

    Artists             = [string[]]
    Performers          = [string[]]
    PerformersSort      = [string[]]
    AlbumArtists        = [string[]]
    AlbumArtistsSort    = [string[]]
    Composers           = [string[]]
    ComposersSort       = [string[]]
    Genres              = [string[]]

    Year                = [uint32]
    Track               = [uint32]
    TrackCount          = [uint32]
    Disc                = [uint32]
    DiscCount           = [uint32]
    BeatsPerMinute      = [uint32]
}

$script:tagLibFileTypes = @(
    "mp3",
    "flac",
    "ogg",
    "wma",
    "mp4",
    "aac",
    "m4a",
    "ape",
    "wav",
    "aiff",
    "au",
    "alac",
    "wavpack",
    "spx",
    "tta"
)



Get-ChildItem -Path $modulesDir -Filter '*.ps1' -Recurse -File |
    ForEach-Object {
        . $_.FullName
    }
