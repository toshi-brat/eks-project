output "endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}

output "kubeconfig-ca-data" {
  value = aws_eks_cluster.eks-cluster.certificate_authority[0].data
}
