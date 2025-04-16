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

resource "dns_test" "test_dns" {
  provider    = catchpoint
  monitor     = "dns experience"  # Monitor type set to 'experience' for DNS
  query_type  = "A"  # Query type set to 'A' for IPv4 address resolution
  
  division_id = 6355
  product_id  = 36005
  test_name   = "DNS Test Experience"
  test_domain = "www.catchpoint.com"  # Domain to be tested

  end_time    = "2025-12-30T04:59:00Z"



  # Schedule the DNS test (Frequency, Node distribution)
  schedule_settings {
    frequency         = "60 minutes"  # Frequency in minutes
    node_distribution = "concurrent"  # Distribution type
    node_ids          = [12, 136]     # Ensure these are valid node IDs
  }

}
