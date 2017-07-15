param (
    # [string]$isClean = "false"
    [string]$configuration = "Release",
    [string]$platform = "win32"
 )

# if ($isClean -eq "false")
# {
#   $param = /p:configuration=$configuration /p:platform=$platform
#   echo "part 1"
# } else {
#   # $param = /t:clean
#   echo "part 2" 
# }

# & msbuild HashFuncs\HashFuncs.vcxproj /p:configuration=$configuration /p:platform=$platform
# & msbuild Logger\Logger.vcxproj /p:configuration=$configuration /p:platform=$platform
& msbuild ClassHierarchy\ClassHierarchy.vcxproj /p:configuration=$configuration /p:platform=$platform
if ($LastExitCode -ne 0)
{
  exit $LastExitCode
}
