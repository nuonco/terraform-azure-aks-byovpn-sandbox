# Azure AKS BYOVPN

Azure sandbox that provisions an AKS cluster in an existing VPN:

## Usage

You can use this sandbox in your app via the [azure-aks-byovpn project](https://github.com/nuonco/sandboxes/tree/main/azure-aks-byovpn) in our sandboxes repo. Add it to your app using the following config:

```hcl
resource "nuon_app" "main" {
  name = "my_azure_aks_byovpn_app"
}

resource "nuon_app_input" "main" {
  app_id = nuon_app.main.id

  input {
    name = "resource_group_name"
    description = "The Resource Group of the VPN to install the app in."
    sensitive = false
    display_name = "Resource Group Name"
    required = true
  }

  input {
    name = "network_name"
    description = "The VPN to install the app in."
    sensitive = false
    display_name = "Network Name"
    required = true
  }

  input {
    name = "subnet_name"
    description = "The Subnet in the VPN to install the app in."
    sensitive = false
    display_name = "Subnet Name"
    required = true
  }
}

resource "nuon_app_sandbox" "main" {
  app_id = nuon_app.main.id
  terraform_version = "v1.6.3"

  public_repo = {
    repo = "nuonco/sandboxes"
    branch = "main"
    directory = "azure-aks-byovpn"
  }
}

resource "nuon_app_runner" "main" {
  app_id      = nuon_app.main.id
  runner_type = "azure-aks"
}
```

## Testing

This sandbox can be tested outside of `nuon` by following these steps:

1. Ensure you have an Azure account setup and `az` installed
1. [Create Service Principal Credentials](https://learn.microsoft.com/en-us/azure/aks/learn/quick-kubernetes-deploy-terraform?tabs=bash#create-a-service-principal)
1. Create a `terraform.tfvars` with the correct variable inputs
