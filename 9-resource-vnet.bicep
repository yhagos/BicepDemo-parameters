@secure()

param location string

param virtualNetworkName string
param addressPrefix string
param subnetName string
param subnetPrefix string



resource vn 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
          networkSecurityGroup: {

          }
        }
      }
    ]
  }
}
