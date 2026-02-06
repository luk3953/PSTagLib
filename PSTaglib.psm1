
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


$script:TagNames = [string[]]@(
    'Title'
    'TitleSort'
    'Album'
    'AlbumSort'
    'Artists'
    'Performers'
    'PerformersSort'
    'AlbumArtists'
    'AlbumArtistsSort'
    'Composers'
    'ComposersSort'
    'Genres'
    'Year'
    'Track'
    'TrackCount'
    'Disc'
    'DiscCount'
    'Comment'
    'Lyrics'
    'Grouping'
    'BeatsPerMinute'
    'Conductor'
    'Copyright'
)


Get-ChildItem -Path $modulesDir -Filter '*.ps1' -Recurse -File |
    ForEach-Object {
        . $_.FullName
    }
