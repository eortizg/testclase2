locals {
    #Debe ser único, ejemplo, alias = "jyapur"
    company = "Contoso1"
    alias = ""
    #ejemplo, region = "East US 2"
    region = "East US"
    #az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<subscriptionID>/resourceGroups/<resourceGroupName>"
    #areas
    bussiness-unit-1 = "Cumplimiento"
    bussiness-unit-2 = "Compras"
    bussiness-unit-3 = "UsuariosDeNegocio"
    bussiness-unit-4 = "Proveedores"

    bussiness-unit-1-short = "cupl"
    bussiness-unit-2-short = "comp"
    bussiness-unit-3-short = "usrn"
    bussiness-unit-4-short = "prov"
    #ambientes
    development = "Development"
    production = "Production"

    development-short = "dev"
    production-short = "prod"
    service-location = "Brazil South"
    
    service-rg-dev = "gp-dev-rg"
    service-rg-prd = "gp-prd-rg"
    service-dev-enviroment = "dev"
    service-prd-enviroment = "prd"

}

