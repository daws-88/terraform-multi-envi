locals {
   common_name = "${var.project}-${terraform.workspace}"
   common_tags = {
        project = "roboshop"
        terraform = "true"
    }
}
# common_ name = roboshop-dev
# common_tags = roboshop
  #environment = lookup(var.environment, terraform.workspace)