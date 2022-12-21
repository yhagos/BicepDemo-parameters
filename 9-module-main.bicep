param location string
param virtualNetworkName string
param addressPrefix string
param subnetName string
param subnetPrefix string
param Vnets array

// @description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
// param dnsLabelPrefix string = toLower('${vmName}-${uniqueString(resourceGroup().id, vmName)}')


module vnets '9-resource-vnet.bicep' = [for vnet in Vnets: {
  name: 'Deploy-${vnet}'
  params: {
    addressPrefix: addressPrefix
    location: location
    subnetName: subnetName
    subnetPrefix: subnetPrefix
    virtualNetworkName: vnet
  }
}]

