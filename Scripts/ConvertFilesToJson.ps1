$paths = (get-childitem -r -file "/mnt/hdd/media/music/flac" | where {$_.fullname -like "*.flac"}).fullname

$audioFiles = $paths | new-audiofile


$audioFiles | foreach-Object {


    $json = $_ | export-AudioFileAsObject | Convertto-Json


    try {
    new-Item ($_.Path.replace("flac","json")) -value $json -force
        write-host "success"
    }
    catch {
        write-error "failure"
    }

}