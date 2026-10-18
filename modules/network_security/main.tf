resource "aws_security_group" "ssh" {
  name        = "${var.name_prefix}-ssh-sg"
  description = "Allow SSH access"
  vpc_id      = var.vpc_id

  tags = {
    Name    = "${var.name_prefix}-ssh-sg"
    Project = var.project_tag
  }
}

resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.allowed_ip_range
  security_group_id = aws_security_group.ssh.id
}

resource "aws_security_group_rule" "ssh_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssh.id
}

resource "aws_security_group" "public_http" {
  name        = "${var.name_prefix}-public-http-sg"
  description = "Allow HTTP access to ALB"
  vpc_id      = var.vpc_id

  tags = {
    Name    = "${var.name_prefix}-public-http-sg"
    Project = var.project_tag
  }
}

resource "aws_security_group_rule" "public_http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.allowed_ip_range
  security_group_id = aws_security_group.public_http.id
}

resource "aws_security_group_rule" "public_http_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_http.id
}

resource "aws_security_group" "private_http" {
  name        = "${var.name_prefix}-private-http-sg"
  description = "Allow HTTP from public HTTP SG"
  vpc_id      = var.vpc_id

  tags = {
    Name    = "${var.name_prefix}-private-http-sg"
    Project = var.project_tag
  }
}

resource "aws_security_group_rule" "private_http_ingress" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.public_http.id
  security_group_id        = aws_security_group.private_http.id
}

resource "aws_security_group_rule" "private_http_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_http.id
}
