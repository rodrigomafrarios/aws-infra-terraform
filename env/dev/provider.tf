module "global_variables" {
  source = "./global_variables"
}

provider "aws" {
  profile = module.global_variables.profile
  region  = module.global_variables.region
}