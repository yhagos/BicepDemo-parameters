
param location string 

var newlocation = 'loc-${location}'

targetScope = 'resourceGroup'

resource myvnet 'Microsoft.ScVmm/virtualNetworks@2020-06-05-preview' = {
  name: myvnet
  location: location
  properties: {
    
  }
  extendedLocation: {
  }
}




