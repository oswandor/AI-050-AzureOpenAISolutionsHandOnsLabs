
# Get the details of a subscription
az account list

# Set the subscription
az account set --subscription "71fa9946-b620-4f31-a39f-0d00a0efa5f2"

# https://learn.microsoft.com/es-es/azure/ai-services/multi-service-resource?pivots=azcli#clean-up-resources


# login 
az login

# List the available locations
az account list-locations --query "[].{Region:name}" --out table


# Create a resource group
az group create --name ai-services-resource-group --location eastus2

# Create a Cognitive Services account
az cognitiveservices account create --name multi-service-resource --resource-group ai-services-resource-group  --kind AIServices --sku F0 --location eastus2 --yes

# Get the resource ID of the Cognitive Services account 
az cognitiveservices account list-usage --name multi-service-resource --resource-group ai-services-resource-group --subscription subscription-name