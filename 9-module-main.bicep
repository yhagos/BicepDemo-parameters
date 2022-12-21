@secure()
param adminPassword string
param location string
param  adminUsername  string 
param virtualNetworkName string
param addressPrefix string
param subnetName string
param subnetPrefix string
param nicName string
param storageAccountName string
param vmName string
param vmSize string
param OSVersion string
param publicIpSku string
param publicIpName string
param publicIPAllocationMethod string
param networkSecurityGroupName string


// @description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
// param dnsLabelPrefix string = toLower('${vmName}-${uniqueString(resourceGroup().id, vmName)}')


module callcommonresources '9-resource-common.bicep' = {
  name: 'callcommon-001'
  params: {
    addressPrefix: addressPrefix
    adminPassword: adminPassword
    adminUsername: adminUsername
    location: location
    networkSecurityGroupName: networkSecurityGroupName
    nicName: nicName
    OSVersion: OSVersion
    publicIPAllocationMethod: publicIPAllocationMethod
    publicIpName: publicIpName
    publicIpSku: publicIpSku
    storageAccountName:storageAccountName
    subnetName: subnetName
    subnetPrefix: subnetPrefix
    virtualNetworkName: virtualNetworkName
    vmName: vmName
    vmSize: vmSize
  }
}
  
