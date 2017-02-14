# Per https://blogs.msdn.microsoft.com/virtual_pc_guy/2010/09/23/a-self-elevating-powershell-script/
# Get the ID and security principal of the current user account
$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator;
if ($myWindowsPrincipal.IsInRole($adminRole))
{
    Clear-Host;
}
else {
    # We are not running as an administrator, so relaunch as administrator
    # Create a new process object that starts PowerShell
    $newProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";
    # Specify the current script path and name as a parameter with added scope and support for scripts with spaces in it's path
    $newProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"
    # Indicate that the process should be elevated
    $newProcess.Verb = "runas";
    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess);
    # Exit from the current, unelevated, process
    Exit;
}

# Run your code that needs to be elevated here...