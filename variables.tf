variable "ec2_account" {
  description = "Object of inputs for ec2 account settings"
  type = object({
    ebs_encryption_by_default = optional(object({
      enabled         = optional(bool, true)
      default_kms_key = optional(string)
    }), {})

    ebs_snapshot_block_public_access = optional(object({
      state = optional(string, "block-all-sharing")
    }), {})

    disable_ebs_snapshot_block_public_access = optional(object({
      state = optional(string)
    }), null)

    image_block_public_access = optional(object({
      state = optional(string, "block-new-sharing")
    }), {})

    serial_console_access = optional(object({
      enabled = optional(bool, false)
    }))

    instance_metadata_defaults_http_endpoint = optional(string, "no-preference")

    instance_metadata_defaults_http_tokens = optional(string, "no-preference")

    instance_metadata_defaults_http_put_response_hop_limit = optional(number, -1)

    instance_metadata_defaults_instance_metadata_tags = optional(string, "no-preference")
  })
  default  = {}
  nullable = false
}
