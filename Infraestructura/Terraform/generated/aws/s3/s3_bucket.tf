resource "aws_s3_bucket" "tfer--s3-002D-grupo6-002D-c1-002D-0821" {
  arn           = "arn:aws:s3:::s3-grupo6-c1-0821"
  bucket        = "s3-grupo6-c1-0821"
  force_destroy = "false"

  grant {
    permissions = ["READ", "READ_ACP"]
    type        = "Group"
    uri         = "http://acs.amazonaws.com/groups/global/AllUsers"
  }

  grant {
    permissions = ["READ_ACP", "READ"]
    type        = "Group"
    uri         = "http://acs.amazonaws.com/groups/global/AuthenticatedUsers"
  }

  grant {
    id          = "efdc37cd3216dce748e467fc4f9fb55bf3fc158671ee329f10333d671c7e97f1"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  grant {
    permissions = ["READ_ACP", "READ"]
    type        = "Group"
    uri         = "http://acs.amazonaws.com/groups/s3/LogDelivery"
  }

  hosted_zone_id      = "Z3BAZG2TWCNX0D"
  object_lock_enabled = "false"
  request_payer       = "BucketOwner"

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}
