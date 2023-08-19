param serverName string
param dbName string
param location string = resourceGroup().location
param skuName string = 'B_Gen5_1'  // Basic tier, Gen5, 1 vCore
param administratorLogin string
param keyVaultName string
param secretName string

resource postgresqlServer 'Microsoft.DBforPostgreSQL/servers@2021-04-10' = {
  name: serverName
  location: location
  properties: {
    version: '11'
    administratorLogin: administratorLogin
    administratorLoginPassword: listSecrets(resourceId('Microsoft.KeyVault/vaults/secrets', keyVaultName, secretName), '2019-09-01').value
    sslEnforcement: 'Enabled'
  }
  sku: {
    name: skuName
    tier: 'Basic' // Represents performance tier of the server
    capacity: 1   // Number of compute units
    size: '51200' // Max storage size in MBs
    family: 'Gen5'
  }
}

resource postgresqlDb 'Microsoft.DBforPostgreSQL/servers/databases@2021-04-10' = {
  name: '${postgresqlServer.name}/${dbName}'
  properties: {}
}
