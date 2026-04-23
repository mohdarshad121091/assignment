module "rg" {
  source = "./resource_group"
  resource_group = var.rgs
}

module "vnet" {
  source = "./vnet"
  depends_on = [ module.rg ]
    virtual_network = var.virtual_networks
    virtual_network_peering = var.peering
}

module "subnet" {
  source = "./subnet"
  depends_on = [ module.vnet ]
  subnet = var.subnet
}

module "vnet_peering" {
  source = "./vnet_peering"
  depends_on = [ module.vnet ]
  virtual_network_peering = var.peering
}

module "keyvault" {
    source = "./keyvault"
    depends_on = [ module.rg ]
    key_vault = var.keyvault
    keyvault_access_policy = var.keyvault_access_policy
    keyvault_secret = var.keyvault_secret
}

module "acr" {
  source = "./acr"
  depends_on = [ module.rg ]
  acr = var.acr
}

module "aks" {
  source = "./aks"
  depends_on = [ module.rg, module.acr, module.subnet ]
  aks = var.aks
  acr_id = module.acr.acr_id["acr1"]
    
  }