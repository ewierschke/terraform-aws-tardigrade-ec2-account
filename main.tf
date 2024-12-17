resource "aws_ebs_encryption_by_default" "this" {
  enabled = var.ec2_account.ebs_encryption_by_default.enabled
}

resource "aws_ebs_default_kms_key" "this" {
  count   = var.ec2_account.ebs_encryption_by_default.default_kms_key != null ? 1 : 0
  key_arn = var.ec2_account.ebs_encryption_by_default.default_kms_key
}

resource "aws_ebs_snapshot_block_public_access" "this" {
  count = var.ec2_account.ebs_snapshot_block_public_access != null ? 1 : 0

  state = var.ec2_account.ebs_snapshot_block_public_access.state
}

resource "aws_ec2_image_block_public_access" "this" {
  state = var.ec2_account.image_block_public_access.state
}

resource "aws_ec2_serial_console_access" "this" {
  count = var.ec2_account.serial_console_access != null ? 1 : 0

  enabled = var.ec2_account.serial_console_access.enabled
}
