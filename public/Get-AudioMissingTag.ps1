function Get-AudioMissingTag {
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline
        )]
        [AudioFile] $AudioFile

    )
    begin {
        
        $keys = ($script:TagTypeMap.Keys).split()
        

    }

    process {

        $tags = $AudioFile.fileTags
        $missingTags = $keys | foreach-object {

            if (!$tags.$_) {
                $_
            }

        }

        @{$AudioFile.FileName() = $missingTags | sort-object}

    }



}