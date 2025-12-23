# =============================================================================
# NETWORK HUB ACCOUNT REQUEST
# =============================================================================

module "network_hub_account" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "duyanh+network@mz.co.kr"
    AccountName               = "Network-Hub Account"
    ManagedOrganizationalUnit = "Infrastructure"
    SSOUserEmail              = "duyanh+network@mz.co.kr"
    SSOUserFirstName          = "Duy"
    SSOUserLastName           = "Anh"
  }

  account_tags = {
    Environment = "infrastructure"
    CostCenter  = "platform"
    Owner       = "network-team"
    Project     = "landing-zone"
  }

  change_management_parameters = {
    change_requested_by = "network-team"
    change_reason       = "Network Hub for centralized networking"
  }

  custom_fields = {
    vpc_cidr           = "10.0.0.0/16" # Network Hub CIDR
    availability_zones = "3"
    environment        = "infrastructure"
  }

  account_customizations_name = "network-hub"
}
