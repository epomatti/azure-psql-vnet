@description('Location for all resources.')
param location string = resourceGroup().location

// var config = loadJsonContent('config.json')

module network './network.bicep' = {
  name: 'networkDeploment'
  params: {
    location: location
  }
}
