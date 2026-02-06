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