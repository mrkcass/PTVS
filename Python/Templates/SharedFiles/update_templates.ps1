#
# Overwrites the common files in certain templates based on the source files
# in this directory. Modifications should be checked in.
#

$web_role_common = @('ps.cmd', 'ConfigureCloudService.ps1', 'WebRoleConfiguration.mht') | %{ gi $_ }
$worker_role_common = @('ps.cmd', 'ConfigureCloudService.ps1', 'LaunchWorker.ps1', 'WorkerRoleConfiguration.mht') | %{ gi $_ }

$web_role_targets = @(
    "..\Web\ItemTemplates\Python\AzureCSWebRole",
    "..\Web\ProjectTemplates\Python\WebRoleBottle",
    "..\Django\ProjectTemplates\Python\WebRoleDjango",
    "..\Web\ProjectTemplates\Python\WebRoleEmpty",
    "..\Web\ProjectTemplates\Python\WebRoleFlask"
) | %{ gi $_ }

$worker_role_targets = @(
    "..\Web\ItemTemplates\Python\AzureCSWorkerRole",
    "..\Web\ProjectTemplates\Python\WorkerRoleProject"
) | %{ gi $_ }

$web_role_targets | %{ copy $web_role_common $_ }
$worker_role_targets | %{ copy $worker_role_common $_ }
