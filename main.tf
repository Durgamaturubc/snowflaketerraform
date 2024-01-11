terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "SnowflakeBCTerraform"

    workspaces {
      name = "snowflake-dev"
    }
  }
}

provider "snowflake" {
  account  = "MS24820"
  user     = "Durga"
  region   = "eastus2.azure"
  password = "Sep@2023!!"
  role     = "ACCOUNTADMIN"
  alias    = "account_admin"
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}