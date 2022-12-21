param location string
param virtualNetworkName string
param addressPrefixes string
param subnets array
param storageAccountName string 

resource stg 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'Storage'
}

resource vn 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefixes
      ]

    }
    subnets: [ for subnet in subnets: {
      name: subnet.subnetName
      properties: {
        addressPrefix: subnet.addressPrefix
      }
    }]
  }
}
