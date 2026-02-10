# PSTaglib

A PowerShell module for reading and writing audio metadata using **taglib-sharp**.  
Designed to be pipeline-first, scriptable, and extensible.

## Features

- Read audio tags into structured objects
- Modify tags in bulk using the PowerShell pipeline
- Explicit save step (no hidden writes)
- Works with multiple formats supported by taglib-sharp (MP3, FLAC, etc.)

## Requirements

- PowerShell 7+
- .NET (as required by taglib-sharp)
- `taglib-sharp.dll` (bundled with the module)

## Installation (local development)

Clone the repository and import the module directly:

```powershell
Import-Module ./PSTaglib.psd1 -Force
```
## Usage

Import your audio files as the AudioFile object:
```powershell
$af = Get-Childitem | New-AudioFile
```
Get the Year tag for all imported AudioFile objects:
```powershell
$af | Get-AudioTag -Name "Year"
```
Change the Year tag on all imported files:
```powershell
$af | Set-AudioTag -Name "Year" -Value 1984
```
Save the modified tags into the original files:
```powershell
$af | Save-AudioFile
```
Find Lyrics and set them as a tag. (use Save-AudioFile to save to file.)
```powershell
$af | Get-AudioFileLyrics | Set-AudioFileLyrics
```
