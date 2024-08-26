
# Get the details of a subscription
az account list

# Set the subscription
az account set --subscription "d3fa7432-dba3-4597-8019-6a76d901bbe3"

# https://learn.microsoft.com/es-es/azure/ai-services/multi-service-resource?pivots=azcli#clean-up-resources


# login 
az login

# List the available locations
az account list-locations --query "[].{Region:name}" --out table


# Create a resource group
az group create --name ai-services-resource-group --location eastus

# Create a Cognitive Services account
az cognitiveservices account create --name modelgptservicescustom --resource-group ai-services-resource-group --location eastus --kind OpenAI --sku s0 --subscription "d3fa7432-dba3-4597-8019-6a76d901bbe3"


# Get the keys and endpoint for the Cognitive Services account
az cognitiveservices account show --name modelgptservicescustom --resource-group  ai-services-resource-group | jq -r .properties.endpoint


# Get primary Key 
az cognitiveservices account keys list --name modelgptservicescustom --resource-group ai-services-resource-group | jq -r .key1

#To deploy a model, use the az cognitiveservices account deployment create command. In the following example, you deploy an instance of the text-embedding-ada-002 model and give it the name MyModel. When you try the example, update the code to use your values for the resource group and resource. You don't need to change the model-version, model-format or sku-capacity, and sku-name values.

# Create a deployment 
az cognitiveservices account deployment create --name modelgptservicescustom --resource-group  ai-services-resource-group --deployment-name MyModel --model-name text-embedding-ada-002 --model-version "1" --model-format OpenAI --sku-capacity "1" --sku-name "Standard"

# Delete a model from your resource 
az cognitiveservices account deployment delete --name modelgptservicescustom --resource-group  ai-services-resource-group --deployment-name MyModel

# Delete a resource group 
az group delete --name ai-services-resource-group --yes 