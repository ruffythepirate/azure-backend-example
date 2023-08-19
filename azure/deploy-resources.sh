#!/bin/bash

# Azure configurations
RESOURCE_GROUP_NAME="jak-backend-example"
LOCATION="westeurope"  # Change this to your preferred Azure region

# Ensure the user is logged in to Azure CLI
az account show > /dev/null 2>&1
if [ $? != 0 ]; then
   echo "Please log in to Azure CLI and then execute this script."
   exit 1
fi

# Create the resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION
if [ $? == 0 ]; then
   echo "Resource group '$RESOURCE_GROUP_NAME' created successfully in '$LOCATION'."
else
   echo "Failed to create resource group."
   exit 1
fi

az deployment group create --resource-group "jak-backend-example" --template-file resources/postgres.bicep --parameters serverName=jak-backend-sandbox dbName=backend-sandbox administratorLogin=ruffy keyVaultName=jak-sandbox-keys secretName=backend-db-admin-password

