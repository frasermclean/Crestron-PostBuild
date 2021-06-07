param($projDir, $targetName, $outputDir, $configFile = "ProcessorConfig.json", $debug = $FALSE);

# Output parameters for verification
if ($debug) {
  Write-Host "Project Directory: $projDir";
  Write-Host "Target Name: $targetName";
  Write-Host "Output Directory: $outputDir";
  Write-Host "Configuration File: $configFile (in project directory)";
}

# generate CPZ file path
$cpzPath = $projDir + $outputDir + $targetName + '.cpz';
if ($debug) {
  Write-Host "Sending CPZ file:" $cpzPath;
}

# read json config file
$configPath = $projDir + $configFile;
$config = Get-Content -Path  $configPath | ConvertFrom-Json
if ($debug) {
  Write-Host "Configuration read: " $config;
}
$hostname = $config.hostname;
$username = $config.username;
$password = $config.password;
$slotNumber = $config.slotNumber;

# send the program to processor
Import-Module PSCrestron
Send-CrestronProgram -Device $hostname -LocalFile $cpzPath -ProgramSlot $slotNumber -Secure -Username $username -Password $password
