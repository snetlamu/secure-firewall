module "ftd-1" {
  source            = "../../"
  num_instances     = var.num_instances
  vm_ads_number     = var.vm_ads_number
  networks          = var.networks
  user_ocid         = var.user_ocid
  fingerprint       = var.fingerprint
  tenancy_ocid      = var.tenancy_ocid
  private_key_path  = var.private_key_path
  private_key       = null
  region            = var.region
  compartment_id    = var.compartment_id
  label_prefix      = var.label_prefix
  vm_compute_shape  = var.vm_compute_shape
  admin_password    = var.admin_password
  hostname          = var.hostname
  admin_ssh_pub_key = var.admin_ssh_pub_key
  day_0_config      = var.day_0_config
  inside_network    = var.inside_network
  mgmt_network      = var.mgmt_network
  diag_network      = var.diag_network
  dmz_network       = var.dmz_network
}