resource "aws_eks_cluster" "eks-cluster" {
 name = "eks-cluster"
 role_arn = var.role
 
 
 vpc_config {
  subnet_ids = [for v in var.snet: v.snet]
  security_group_ids = [var.sg]
 }
}

 resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = aws_eks_cluster.eks-cluster.name
  node_group_name = "workernodes"
  node_role_arn  = var.node-role
  subnet_ids   = [for v in var.snet: v.snet]
  instance_types = ["t3.medium"]
 
  scaling_config {
   desired_size = 2
   max_size   = 2
   min_size   = 2
  }
  
 
   }

  