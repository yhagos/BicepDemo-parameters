

param Vnets array

// @description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
// param dnsLabelPrefix string = toLower('${vmName}-${uniqueString(resourceGroup().id, vmName)}')


module vnets '9-resource-vnet.bicep' = [for vnet in Vnets: {
  name: 'Deploy-${vnet}'
  params: {
    addressPrefix: vnet.addressPrefix
    location: vnet.location
    subnets: vnet.subnets
    virtualNetworkName: vnet.virtualNetworkName
  }
}]

