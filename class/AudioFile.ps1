class AudioFile {

    [TagLib.File]        $file
    [TagLib.CombinedTag] $fileTags
    [string]             $Path

    AudioFile([string]$Path) {
        $this.file     = [TagLib.File]::Create($Path)
        $this.fileTags = $this.file.Tag
        $this.Path     = $Path
    }

    SetTitle([string]$Title) {
        $this.fileTags.Title = $Title
    }

    SetTitleSort([string]$TitleSort) {
        $this.fileTags.TitleSort = $TitleSort
    }

    SetAlbum([string]$Album) {
        $this.fileTags.Album = $Album
    }

    SetAlbumSort([string]$AlbumSort) {
        $this.fileTags.AlbumSort = $AlbumSort
    }

    SetArtists([string[]]$Artists) {
        $this.fileTags.Artists = $Artists
    }

    SetPerformers([string[]]$Performers) {
        $this.fileTags.Performers = $Performers
    }

    SetPerformersSort([string[]]$PerformersSort) {
        $this.fileTags.PerformersSort = $PerformersSort
    }

    SetAlbumArtists([string[]]$AlbumArtists) {
        $this.fileTags.AlbumArtists = $AlbumArtists
    }

    SetAlbumArtistsSort([string[]]$AlbumArtistsSort) {
        $this.fileTags.AlbumArtistsSort = $AlbumArtistsSort
    }

    SetComposers([string[]]$Composers) {
        $this.fileTags.Composers = $Composers
    }

    SetComposersSort([string[]]$ComposersSort) {
        $this.fileTags.ComposersSort = $ComposersSort
    }

    SetGenres([string[]]$Genres) {
        $this.fileTags.Genres = $Genres
    }

    SetYear([uint32]$Year) {
        $this.fileTags.Year = $Year
    }

    SetTrack([uint32]$Track) {
        $this.fileTags.Track = $Track
    }

    SetTrackCount([uint32]$TrackCount) {
        $this.fileTags.TrackCount = $TrackCount
    }

    SetDisc([uint32]$Disc) {
        $this.fileTags.Disc = $Disc
    }

    SetDiscCount([uint32]$DiscCount) {
        $this.fileTags.DiscCount = $DiscCount
    }

    SetComment([string]$Comment) {
        $this.fileTags.Comment = $Comment
    }

    SetLyrics([string]$Lyrics) {
        $this.fileTags.Lyrics = $Lyrics
    }

    SetGrouping([string]$Grouping) {
        $this.fileTags.Grouping = $Grouping
    }

    SetBeatsPerMinute([uint32]$BPM) {
        $this.fileTags.BeatsPerMinute = $BPM
    }

    SetConductor([string]$Conductor) {
        $this.fileTags.Conductor = $Conductor
    }

    SetCopyright([string]$Copyright) {
        $this.fileTags.Copyright = $Copyright
    }

    Save() {
        $this.file.Save()
    }
}