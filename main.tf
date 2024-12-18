resource "aws_ebs_encryption_by_default" "this" {
  enabled = var.ec2_account.ebs_encryption_by_default.enabled
}

resource "aws_ebs_default_kms_key" "this" {
  count   = var.ec2_account.ebs_encryption_by_default.default_kms_key != null ? 1 : 0
  key_arn = var.ec2_account.ebs_encryption_by_default.default_kms_key
}

resource "aws_ebs_snapshot_block_public_access" "this" {
  count = var.ec2_account.disable_ebs_snapshot_block_public_access == null ? 1 : 0

  state = var.ec2_account.ebs_snapshot_block_public_access.state
}

resource "aws_ec2_image_block_public_access" "this" {
  state = var.ec2_account.image_block_public_access.state
}

resource "aws_ec2_serial_console_access" "this" {
  count = var.ec2_account.serial_console_access != null ? 1 : 0

  enabled = var.ec2_account.serial_console_access.enabled
}

resource "aws_ec2_instance_metadata_defaults" "this" {
  http_endpoint               = var.ec2_account.instance_metadata_defaults_http_endpoint
  http_tokens                 = var.ec2_account.instance_metadata_defaults_http_tokens
  http_put_response_hop_limit = var.ec2_account.instance_metadata_defaults_http_put_response_hop_limit
  instance_metadata_tags      = var.ec2_account.instance_metadata_defaults_instance_metadata_tags
}