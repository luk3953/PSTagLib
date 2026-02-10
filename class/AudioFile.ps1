class AudioFile {

    [TagLib.File]        $file
    [TagLib.CombinedTag] $fileTags
    [string]             $Path
    [Lyrics]             $Lyrics

    AudioFile([string]$Path) {
        $this.file     = [TagLib.File]::Create($Path)
        $this.fileTags = $this.file.Tag
        $this.Path     = $Path
    }

    [string] FileName() {
        
        $fileName = (($this.Path).split([IO.Path]::DirectorySeparatorChar))[-1]
        return $fileName

    }

    SetLyrics([string]$Mode) {

        if (-not $this.Lyrics) {
            throw "No lyrics attached to this AudioFile."
        }

        switch ($Mode.ToLower()) {
            'unsynced' {
                $this.fileTags.Lyrics = $this.Lyrics.Plain
            }
            'synced' {
                $this.fileTags.Lyrics = $this.Lyrics.Synced
            }
            default {
                throw "Invalid mode. Use 'plain' or 'synced'."
            }
        }
    }

    Save() {
        $this.file.Save()
    }
}