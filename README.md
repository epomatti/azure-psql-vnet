# Azure PostgreSQL VNET integration

Demonstrating VNET integration with PostgreSQL Flexible Server.

> 🤦‍♂️ PG Flexible Server currently does not support Private Endpoints.

```sh
az group create -n rg-myapp -l brazilsouth
```

Copy the template and set your variables:

```sh
cp config-template.json config.json
```

Always check for Bicep upgrades: `az bicep upgrade`.

Create the resources:

```sh
az deployment group create -g rg-myapp -f main.bicep
```

To find the latest API versions access [Azure REST API Specs][1].

Detailed API values can be found at the [REST API][2] documentation.

More bout dedicated services in the [documentation][3].

Also more information about PostgreSQL Flexible Server [networking concepts][4].

[1]: https://github.com/Azure/azure-rest-api-specs
[2]: https://learn.microsoft.com/en-us/azure/templates/microsoft.dbforpostgresql/flexibleservers?pivots=deployment-language-bicep
[3]: https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-for-azure-services
[4]: https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/concepts-networking
