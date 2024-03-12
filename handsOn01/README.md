# Deploy to Azure Using the Terraform Command Line Interface (CLI)

* Initialize the terraform using ```terraform init``` after assigning the **PROVIDER**
* You already have a Resource Group in your Azure Account
* So import it using ```terraform import azurerm_resource_group.resourceGroupName resourceIDFromProperties```
* Plan the code and save the output to **TFPLAN** by ```terraform plan -out tfplan```
* Apply the saved plan using ```terraform apply tfplan``` and you'll see a **STORAGE** created in the Azure Resource Group.
