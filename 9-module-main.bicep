
param Vnets array
param storageAccountName string
param vms array

// @description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
// param dnsLabelPrefix string = toLower('${vmName}-${uniqueString(resourceGroup().id, vmName)}')


module vnets '9-resource-vnet.bicep' = [for vnet in Vnets: {
  name: '${vnet.virtualNetworkName}${uniqueString(resourceGroup().id)}'
  params: {
    addressPrefixes: vnet.addressPrefixes[0]
    location: vnet.location
    subnets: vnet.subnets
    virtualNetworkName: vnet.virtualNetworkName
    storageAccountName: storageAccountName
  }
}]


module vmssss '9-resource-vm.bicep' = [for vm in vms: {
  name: '${vm.virtualNetworkName}${uniqueString(resourceGroup().id)}'
  params: {
    adminPassword: vm.adminPassword
    adminUsername:  vm.adminUsername
    location:  vm.location
    networkSecurityGroupName:  vm.networkSecurityGroupName
    nicName:   vm.nicName
    OSVersion:  vm.OSVersion
    publicIPAllocationMethod:  vm.publicIPAllocationMethod
    publicIpName:  vm.publicIpName
    publicIpSku:  vm.publicIpSku
    storageAccountName:  vm.storageAccountName
    subnetName:  vm.subnetName
    virtualNetworkName:  vm.virtualNetworkName
    vmName:  vm.vmName
    vmSize:  vm.vmSize
  }
}]

