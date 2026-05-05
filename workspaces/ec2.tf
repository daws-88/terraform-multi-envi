resource "aws_instance" "terraform" {
  ami = var.ami_id
  instance_type = lookup(var.instance_type,terraform.workspace)
  vpc_security_group_ids = [aws_security_group.allow-1.id]
  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name}-workspace"
    }
  )
}

resource "aws_security_group" "allow-1" {
  name ="${local.common_name}-workspace"

  ingress {
    from_port = var.ingress_from_port
    to_port = var.ingress_to_port
    protocol = var.protocol
    cidr_blocks = var.cidir
  }
  
  egress {
    from_port = var.egress_from_port
    to_port = var.egress_from_port
    protocol = var.protocol # from all protocols
    cidr_blocks = var.cidir
  }
   tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name}-workspace"
    }
  )
}