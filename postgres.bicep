@description('Location for all resources.')
param location string

param administratorLogin string

@secure()
param administratorLoginPassword string

// param virtualNetworkExternalId string = ''
// param subnetName string = ''

param subnetId string = ''
param privateDnsZoneArmResourceId string = ''

var serverName = 'psql-workload-${uniqueString(resourceGroup().id)}'

resource serverName_resource 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: serverName
  location: location
  sku: {
    name: 'Standard_B1ms'
    tier: 'GeneralPurpose'
  }
  properties: {
    version: '15'
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    network: {
      // delegatedSubnetResourceId: (empty(virtualNetworkExternalId) ? null : json('\'${virtualNetworkExternalId}/subnets/${subnetName}\''))
      // privateDnsZoneArmResourceId: (empty(virtualNetworkExternalId) ? null : privateDnsZoneArmResourceId)
      delegatedSubnetResourceId: (empty(subnetId) ? null : subnetId)
      privateDnsZoneArmResourceId: (empty(subnetId) ? null : privateDnsZoneArmResourceId)
    }
    highAvailability: {
      mode: 'Disabled'
    }
    storage: {
      storageSizeGB: 128
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
    // availabilityZone: 1
  }
}
