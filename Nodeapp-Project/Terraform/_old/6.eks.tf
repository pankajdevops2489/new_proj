resource "aws_eks_cluster" "eks" {
 name = "eks-cluster"
 role_arn = aws_iam_role.eks-iam-role.arn

 vpc_config {
  subnet_ids = [aws_subnet.sub1.id, aws_subnet.sub2.id]
 }

 depends_on = [
  aws_iam_role.eks-iam-role,
 ]
}

resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = aws_eks_cluster.eks.name
  node_group_name = "workernodes"
  node_role_arn  = aws_iam_role.workernodes.arn
  subnet_ids   = [aws_subnet.sub3.id, aws_subnet.sub4.id]
  instance_types = ["t3.xlarge"]
 
  scaling_config {
   desired_size = 1
   max_size   = 1
   min_size   = 1
  }
 
  depends_on = [
   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
   #aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
 }

  