resource "aws_kms_key" "key" {}

resource "aws_db_subnet_group" "subnet_group" {
  subnet_ids = [aws_subnet.private_a.id, aws_subnet.private_b.id]
}

resource "aws_rds_cluster" "cluster" {
  cluster_identifier     = "private-db-cluster"
  database_name          = "privatedb"
  master_password        = "password"
  master_username        = "dba"
  vpc_security_group_ids = [aws_security_group.sg.id]
  storage_encrypted      = true
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  kms_key_id             = aws_kms_key.key.arn
  engine                 = "aurora-mysql"
}

resource "aws_rds_cluster_instance" "instance" {
  count              = 2
  identifier         = "private-db-${count.index}"
  cluster_identifier = aws_rds_cluster.cluster.id
  instance_class     = "db.r5.large"
  engine             = "aurora-mysql"
}