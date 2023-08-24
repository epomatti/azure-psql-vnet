# Azure PostgreSQL VNET integration

Demonstrating VNET integration with PostgreSQL Flexible Server.

> 🤦‍♂️ PG Flexible Server currently does not support Private Endpoints

```
az group create -n rg-myapp -l brazilsouth
```

Copy the template and set your variables:

```sh
cp config-template.json config.json
```

Always check for Bicep upgrades: `az bicep upgrade`.

Create the resources:

```
az deployment group create -g rg-myapp -f main.bicep
```

