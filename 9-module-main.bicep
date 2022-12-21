param location string
param virtualNetworkName string
param addressPrefix string
param subnetName string
param subnetPrefix string

// @description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
// param dnsLabelPrefix string = toLower('${vmName}-${uniqueString(resourceGroup().id, vmName)}')

var vnetcount = 2

module vnets '9-resource-vnet.bicep' = [for i in range(0, vnetcount): {
  name: 'vnet-${i}'
  params: {
    addressPrefix: addressPrefix
    location: location
    subnetName: subnetName
    subnetPrefix: subnetPrefix
    virtualNetworkName: '${virtualNetworkName}-${i}'
  }
}]

