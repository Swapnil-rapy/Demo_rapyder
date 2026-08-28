#cluster security group
resource "aws_security_group" "cluster" {
  name        = "${var.cluster_name}-cluster-sg"
  description = "Security group for EKS control plane"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.cluster_name}-cluster-sg"
  }
}

#Node security group
resource "aws_security_group" "node" {
  name        = "${var.cluster_name}-node-sg"
  description = "Security group for EKS worker nodes"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.cluster_name}-node-sg"
  }
}

#cluster to node communication
resource "aws_security_group_rule" "cluster_to_node" {
  type                     = "ingress"
  security_group_id        = aws_security_group.node.id
  source_security_group_id = aws_security_group.cluster.id

  protocol = "-1"
  from_port = 0
  to_port   = 0
}

#node to cluster communication
resource "aws_security_group_rule" "node_to_cluster" {
  type                     = "ingress"
  security_group_id        = aws_security_group.cluster.id
  source_security_group_id = aws_security_group.node.id

  protocol = "tcp"
  from_port = 443
  to_port   = 443
}

#Node to node communication
resource "aws_security_group_rule" "node_to_node" {
  type                     = "ingress"
  security_group_id        = aws_security_group.node.id
  source_security_group_id = aws_security_group.node.id

  protocol = "-1"
  from_port = 0
  to_port   = 0
}


