module "eks" {
  source    = "../modules/EKS_Cluster"
  role      = module.roles.role-arn
  node-role = module.roles.workernode-role-arn
  snet = {
    snet-1 = {
      snet = lookup(module.uat_vpc.pri-snet-id, "ps1", null).id
    }
    snet-2 = {
      snet = lookup(module.uat_vpc.pri-snet-id, "ps2", null).id
    }
  }
  sg = lookup(module.eks-sg.output-sg-id, "eks-sg", null)
}