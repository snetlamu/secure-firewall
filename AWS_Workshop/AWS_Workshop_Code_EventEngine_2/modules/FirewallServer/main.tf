# # ##################################################################################################################################
# # # Create the Cisco FMC and FTD Instances
# # ##################################################################################################################################

resource "aws_instance" "ftdv" {
  count               = var.instances_per_az * var.availability_zone_count
  ami                 = data.aws_ami.ftdv.id
  instance_type       = var.ftd_size
  key_name            = var.keyname
  network_interface {
    network_interface_id = element(var.ftd_mgmt_interface,count.index)
    device_index         = 0
  }
  network_interface {
    network_interface_id = element(var.ftd_diag_interface,count.index)
    device_index         = 1
  }
  network_interface {
    network_interface_id = element(var.ftd_outside_interface,count.index)
    device_index         = 2
  }
  network_interface {
    network_interface_id = element(var.ftd_inside_interface,count.index)
    device_index         = 3
  }
  user_data = data.template_file.ftd_startup_file[count.index].rendered
  tags = merge({
    Name = "Cisco ftdv${count.index}"
  },var.tags)
}