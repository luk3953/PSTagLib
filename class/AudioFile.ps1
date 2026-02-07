class AudioFile {

    [TagLib.File]        $file
    [TagLib.CombinedTag] $fileTags
    [string]             $Path

    AudioFile([string]$Path) {
        $this.file     = [TagLib.File]::Create($Path)
        $this.fileTags = $this.file.Tag
        $this.Path     = $Path
    }

    [string] FileName() {
        
        $fileName = (($this.Path).split([IO.Path]::DirectorySeparatorChar))[-1]
        return $fileName

    }

    Save() {
        $this.file.Save()
    }
}