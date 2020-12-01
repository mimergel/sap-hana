/*
Description:

  Example to deploy deployer(s) using local backend.
*/
module "sap_deployer" {
  source                  = "../../terraform-units/modules/sap_deployer"
  infrastructure          = local.infrastructure
  deployers               = local.deployers
  options                 = local.options
  ssh-timeout             = local.ssh-timeout
  sshkey                  = local.sshkey
  key_vault               = local.key_vault
  naming                  = module.sap_namegenerator.naming
}

module "sap_namegenerator" {
  source               = "../../terraform-units/modules/sap_namegenerator"
  environment          = local.environment
  location             = local.location
  codename             = local.codename
  management_vnet_name = local.vnet_mgmt_name_part
  random_id            = module.sap_deployer.random_id
  deployer_vm_count    = local.deployer_vm_count
}
