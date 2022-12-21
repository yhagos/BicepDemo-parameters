param location string
param virtualNetworkName string
param addressPrefixes string
param subnets array


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
        addressPrefix: subnet.subnetPrefix
        networkSecurityGroup: {

        }
      }
    }]
  }
}
