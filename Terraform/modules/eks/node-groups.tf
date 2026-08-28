resource "aws_iam_role" "node_role" {
  name = "${var.cluster_name}-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}


# Worker node policy

resource "aws_iam_role_policy_attachment" "worker_node_policy" {
  role = aws_iam_role.node_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}


# ECR pull policy

resource "aws_iam_role_policy_attachment" "ecr_policy" {
  role = aws_iam_role.node_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
}


# CNI policy

resource "aws_iam_role_policy_attachment" "cni_policy" {
  role = aws_iam_role.node_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}


resource "aws_eks_node_group" "main" {
  cluster_name = aws_eks_cluster.main.name

  node_group_name = "${var.cluster_name}-node-group"

  node_role_arn = aws_iam_role.node_role.arn

  subnet_ids = var.subnet_ids

  instance_types = [
    "t3.medium"
  ]

  ami_type = "AL2023_x86_64_STANDARD"

  capacity_type = "ON_DEMAND"

  scaling_config {
    desired_size = 2

    min_size = 1

    max_size = 3
  }


  update_config {
    max_unavailable = 1
  }


  labels = {
    environment = "sample"
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.ecr_policy,
    aws_iam_role_policy_attachment.cni_policy
  ]

  tags = {
    Name = "${var.cluster_name}-node-group"
  }
}