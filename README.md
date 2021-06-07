# Crestron Post Build Script
This repository contains a post build script automating the process of uploading a CPZ file to a Crestron processor once the build is complete.

## Requirements
The script uses Microsoft PowerShell and the Crestron EDK. PowerShell is included with modern Windows installations but the Crestron EDK needs to be installed from https://sdkcon78221.crestron.com/sdk/Crestron_EDK_SDK/Content/Topics/Home.htm

# Configuration file
The JSON configuration file should reside in the same directory as the project. By default, the script looks for a file named ProcessorConfig.json. This file defines the hostname and authentication details used to communicate with the Crestron processor. There is a sample file in this repository for reference.

## Adding the script to your post-build event
Place the SendProgram.ps1 script in the root of your solution directory. Open your Visual Studio project properties and under the Build Events section add the following under the Post-build event command line text block.
```
PowerShell.exe -NoProfile -ExecutionPolicy RemoteSigned -file $(SolutionDir)SendProgram.ps1 -projDir $(ProjectDir) -targetName $(TargetName) -outputDir $(OutDir)
```
