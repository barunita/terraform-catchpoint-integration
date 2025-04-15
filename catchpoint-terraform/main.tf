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

resource "web_test" "test" {
  provider    = catchpoint
  monitor     = "object"  # Monitor type: 'object' is used here (ensure this is correct)
  division_id = 6355
  product_id  = 24368
  test_name   = "catchpointTf"
  test_url    = "https://www.catchpoint.com"
  
  # Change end date to 2025-04-20
  end_time    = "2025-04-20T04:59:00Z"  # New end time (April 20, 2025)

  request_settings {
    http_request_headers {
      user_agent {
        value = "terraform"
      }
      accept {
        value             = "application/json"
        child_host_pattern = "www.google.com"
      }
    }
  }

  schedule_settings {
    frequency         = "60 minutes"
    node_distribution = "concurrent"
    node_ids          = [12, 136] # Ensure these are valid node IDs
  }

}
