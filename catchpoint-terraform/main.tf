terraform {
  required_providers {
    catchpoint = {
      source = "catchpoint/catchpoint"
      version = "1.5.0"  # Ensure this is the correct version you want to use
    }
  }
}

provider "catchpoint" {
  api_token = "B0A80F3FB8F4E5D66ED1439C69F1F9231AD70714C68226CCCC64BF8F99C4D23B"  # Replace with your actual API token
}

# Reference all the test files here (modularize the tests)
module "test_http" {
  source = "./tests/test_http"
}

module "test_dns" {
  source = "./tests/test_dns"
}