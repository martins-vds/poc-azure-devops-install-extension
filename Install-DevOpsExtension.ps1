[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, HelpMessage = "Azure DevOps Organization Name")]
    [ValidateNotNullOrEmpty()]
    [string]
    $Organization,
    [Parameter(Mandatory = $true, HelpMessage = "Publisher Name")]
    [ValidateNotNullOrEmpty()]
    [ValidatePattern("^[a-z0-9]+[a-z0-9\-]*[a-z0-9]+$", ErrorMessage = "Publisher name must start with a letter or number, contain only letters, numbers, or dashes, and end with a letter or number.")]
    [string]
    $PublisherName,
    [Parameter(Mandatory = $true, HelpMessage = "Extension Name")]
    [ValidateNotNullOrEmpty()]
    [ValidateLength(1, 63)]
    [ValidatePattern("^[a-z0-9]+[a-z0-9\-]*[a-z0-9]+$", ErrorMessage = "Extension name must start with a letter or number, contain only letters, numbers, or dashes, and end with a letter or number.")]
    [string]
    $ExtensionName,
    [Parameter(Mandatory = $true, HelpMessage = "Personal Access Token")]
    [ValidateNotNullOrEmpty()]
    [string]
    $Token
)

$ErrorActionPreference = "Stop"

function EncodeToBase64($string) {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($string)
    $encoded = [System.Convert]::ToBase64String($bytes)
    return $encoded
}

function ParseErrorMessage($err) {
    $errObj = $err | ConvertFrom-Json -Depth 10

    $errMessage = $errObj.psobject.Properties | Where-Object -Property Name -EQ -Value "message" | Select-Object -First 1 -ExpandProperty Value

    if (![string]::IsNullOrEmpty($errMessage)) {
        return $errMessage
    }
    else {
        return $err
    }

}

$headers = @{
    Authorization  = "Basic $(EncodeToBase64(":$($Token)"))"
    Accept         = "application/json; api-version=7.0-preview.1"
    "Content-Type" = "application/json"
}

$installExtensionUrl = "https://extmgmt.dev.azure.com/$Organization/_apis/extensionmanagement/installedextensionsbyname/$PublisherName/$ExtensionName"

try {
    Invoke-RestMethod -Uri $installExtensionUrl -Method Post -Headers $headers | Out-Null
    Write-Host "Extension '$PublisherName.$ExtensionName' installed successfully" -ForegroundColor Green
}
catch [Microsoft.PowerShell.Commands.HttpResponseException] {
    if ($_.Exception.Response.StatusCode -eq 409) {
        Write-Host "Extension '$PublisherName.$ExtensionName' already installed" -ForegroundColor Yellow
        exit 0
    }

    $errMessage = ParseErrorMessage($_.ErrorDetails.Message)
    Write-Host "Error installing extension '$PublisherName.$ExtensionName': $errMessage" -ForegroundColor Red
    exit 1
}