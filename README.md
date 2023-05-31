# Install-DevOpsExtension PowerShell Script

This PowerShell script is designed to help you install an Azure DevOps extension. It requires several parameters to be provided in order to install the extension.

## Prerequisites

Before running this script, please ensure you have the following:

- PowerShell version 5.1 or later.

## Usage

To use this script, follow the steps below:

1. Open PowerShell.
2. Run the script using the following command:

```powershell
.\Install-DevOpsExtension.ps1 -Organization <Organization> -PublisherName <PublisherName> -ExtensionName <ExtensionName> -Token <Token>
```

Replace `<Organization>`, `<PublisherName>`, `<ExtensionName>`, and `<Token>` with your own values.

## Parameters

The script accepts the following parameters:

- `Organization`: Azure DevOps organization name. **This parameter is mandatory**.
- `PublisherName`: Publisher name for the extension. Must meet the specified pattern and length criteria. **This parameter is mandatory**.
- `ExtensionName`: Name of the extension. Must meet the specified pattern and length criteria. **This parameter is mandatory**.
- `Token`: Personal Access Token with at least the scope `Extensions (Read & Manage)` . **This parameter is mandatory**.

## Example

Here is an example of how to use this script:

```powershell
.\Install-DevOpsExtension.ps1 -Organization "myorg" -PublisherName "my-publisher" -ExtensionName "my-extension" -Token "token"
```

Make sure to replace `"myorg"`, `"my-publisher"`, `"my-extension"`, and `"token"` with your own values.

## License

This script is released under the [MIT License](https://opensource.org/licenses/MIT).

## Contributions

Contributions are welcome! If you find any issues or have suggestions, please open an issue or submit a pull request.

## Disclaimer

This script is provided as-is, without any warranty or support. Use it at your own risk.