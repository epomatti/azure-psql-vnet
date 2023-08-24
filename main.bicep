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

module postgresPrivate './postgres.bicep' = {
  name: 'postgresDeployment'
  params: {
    location: location
    nameAffix: 'private'
    administratorLogin: config.administratorLogin
    administratorLoginPassword: config.administratorLoginPassword
    subnetId: network.outputs.pgsqlSubnetId
    privateDnsZoneArmResourceId: dnsZone.outputs.postgresPrivateDnsZoneId
  }
}

module postgresInternet './postgres.bicep' = {
  name: 'postgresInternetDeployment'
  params: {
    location: location
    nameAffix: 'internet'
    administratorLogin: config.administratorLogin
    administratorLoginPassword: config.administratorLoginPassword
  }
}

module vm './vm.bicep' = {
  name: 'vmDeployment'
  params: {
    location: location
    subnetId: network.outputs.vmSubnetId
    username: 'vmclient'
    password: 'P@ssw0rd.123'
  }
}
