# Install-DevOpsExtension PowerShell Script

This PowerShell script is designed to help you install an Azure DevOps extension. It requires several parameters to be provided in order to install the extension.

## Prerequisites

Before running this script, please ensure you have the following:

- PowerShell version 7.3 or later. You can download PowerShell from [here](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3)

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
  - For more information on how to create a Personal Access Token (PAT), please refer to [this documentation](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows).

> Note: The `PublisherName` and `ExtensionName` parameters can be found in the marketplace URL for the extension. For example, if the URL is `https://marketplace.visualstudio.com/items?itemName=my-publisher.my-extension`, then the `PublisherName` is `my-publisher` and the `ExtensionName` is `my-extension`.

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
