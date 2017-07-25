param (
    [string]$configuration = "Debug",
    [string]$platform = "Win32"
 )

$buildPath = "$pwd\Building"
If(test-path $buildPath)
{
  Remove-Item -Recurse -Force $buildPath
}
New-Item -ItemType Directory -Force -Path $buildPath

function buildOneProject ([string]$projectName) {
  xcopy /s/e/y $projectName $buildPath
  & msbuild $buildPath\$projectName.vcxproj /p:configuration=$configuration /p:platform=$platform /Property:SolutionDir=$buildPath\
  if ($LastExitCode -ne 0)
  {
    exit $LastExitCode
  }
}

# & msbuild cxx-api\cxx-api.vcxproj /p:configuration=$configuration /p:platform=$platform /Property:SolutionDir=$pwd\cxx-app
# if ($LastExitCode -ne 0)
# {
#   exit $LastExitCode
# }

# & msbuild cxx-app\cxx-app.vcxproj /p:configuration=$configuration /p:platform=$platform /Property:SolutionDir=$pwd\cxx-app
# if ($LastExitCode -ne 0)
# {
#   exit $LastExitCode
# }

buildOneProject cxx-api
buildOneProject cxx-app
