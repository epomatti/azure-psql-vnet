@description('Location for all resources.')
param location string = resourceGroup().location

var config = loadJsonContent('config.json')

module network './network.bicep' = {
  name: 'networkDeploment'
  params: {
    location: location
  }
}

module dnsZone './dnszone.bicep' = {
  name: 'dnsZoneDeployment'
  params: {
    vnetId: network.outputs.vnetId
  }
}

// module postgres './postgres.bicep' = {
//   name: 'postgresDeployment'
//   params: {
//     location: location
//     administratorLogin: config.administratorLogin
//     administratorLoginPassword: config.administratorLoginPassword
//     subnetId: network.outputs.pgsqlSubnetId
//     privateDnsZoneArmResourceId: dnsZone.outputs.postgresPrivateDnsZoneId
//   }
// }
