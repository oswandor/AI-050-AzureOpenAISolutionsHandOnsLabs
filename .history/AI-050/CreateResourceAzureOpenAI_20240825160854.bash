
# az group create --name ai-services-resource-group --location westus2


# login 
az login

# List the available locations
az account list-locations --query "[].{Region:name}" --out table


# Create a resource group
az group create --name ai-services-resource-group --location westus2

# Create a Cognitive Services account
az cognitiveservices account create --name multi-service-resource --resource-group ai-services-resource-group  --kind AIServices --sku S0 --location westus2 --yes

# Get the resource ID of the Cognitive Services account 
az cognitiveservices account list-usage --name multi-service-resource --resource-group ai-services-resource-group --subscription subscription-name