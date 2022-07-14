data "terraform_remote_state" "transit_gateway" {
  backend = "local"

  config = {
    path = "../../../generated/aws/transit_gateway/terraform.tfstate"
  }
}
