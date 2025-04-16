terraform {
  required_providers {
    catchpoint = {
      source = "catchpoint/catchpoint"
      version = "1.5.0"
    }
  }
}

provider "catchpoint" {
  api_token = "B0A80F3FB8F4E5D66ED1439C69F1F9231AD70714C68226CCCC64BF8F99C4D23B"  # Replace with your actual API token
}

resource "web_test" "http_test" {
  provider    = catchpoint
  monitor     = "object"
  division_id = 6355
  product_id  = 24368
  test_name   = "HTTP Test Terraform"
  test_url    = "https://www.example.com"
  
  end_time    = "2025-04-20T04:59:00Z"

  request_settings {
    http_request_headers {
      user_agent {
        value = "terraform"
      }
      accept {
        value             = "application/json"
        child_host_pattern = "www.example.com"
      }
    }
  }

  schedule_settings {
    frequency         = "60 minutes"
    node_distribution = "concurrent"
    node_ids          = [12, 136]
  }

}
