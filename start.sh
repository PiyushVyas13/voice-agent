#!/bin/bash

# Login to Azure using managed identity
az login --identity

# Fetch credentials from Key Vault
az keyvault secret show --vault-name "voice-agent-vault" --name "google-oauth-credentials" --query "value" -o tsv > credentials.json

# Fetch API key and set as environment variable
export GOOGLE_API_KEY=$(az keyvault secret show --vault-name "voice-agent-vault" --name "google-api-key" --query "value" -o tsv)

# Start the application
uvicorn app.main:app --host 0.0.0.0 --port 8000 