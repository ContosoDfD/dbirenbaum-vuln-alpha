param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'alphaopenstorage'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: false
    allowBlobPublicAccess: true
    minimumTlsVersion: 'TLS1_0'
    networkAcls: {
      defaultAction: 'Allow'
    }
  }
}

resource sqlServer 'Microsoft.Sql/servers@2023-05-01-preview' = {
  name: 'alpha-sql-server'
  location: location
  properties: {
    administratorLogin: 'sqladmin'
    administratorLoginPassword: 'P@ssw0rd123!'
    publicNetworkAccess: 'Enabled'
    minimalTlsVersion: '1.0'
  }
}