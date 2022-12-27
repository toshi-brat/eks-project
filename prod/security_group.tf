module "eks-sg" {
  source = "../modules/Security_Group"
  vpc_id = module.uat_vpc.vpc-id
  sg_details = {
    "eks-sg" = {
      description = "httpd inbound"
      name        = "lb-sg"
      ingress_rules = [
        {
          cidr_blocks     = ["0.0.0.0/0"]
          from_port       = 80
          protocol        = "tcp"
          self            = null
          to_port         = 80
          security_groups = null
        },
        {
          cidr_blocks     = ["0.0.0.0/0"]
          from_port       = 443
          protocol        = "tcp"
          self            = null
          to_port         = 443
          security_groups = null
        }
      ]
    }
  }
}

