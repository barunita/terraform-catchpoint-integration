resource "catchpoint_test" "test" {
  provider = catchpoint
  monitor  = "object"
  
  # Use your provided IDs for division and product
  division_id = 6355
  product_id  = 24368
  
  test_name   = "catchpointTf"
  test_url    = "https://www.catchpoint.com"
  
  # Schedule to run for the next 1 month (start and end time)
  start_time  = "2024-08-05T00:00:00Z"  # Start time
  end_time    = "2025-09-05T04:59:00Z"  # End time (next 1 month)
  
  request_settings {
    http_request_headers {
      user_agent {
        value = "terraform"
      }
      accept {
        value              = "application/json"
        child_host_pattern = "www.google.com"
      }
    }
  }

  schedule_settings {
    frequency          = "60 minutes"
    node_distribution  = "concurrent"
    node_ids           = [12, 136]
  }

  alert_settings {
    alert_rule {
      alert_type              = "test failure"
      node_threshold_type     = "runs"
      threshold_number_of_runs = 2
      threshold_percentage_of_runs = 60
    }

    notification_group {
      recipient_email_ids = ["abanerjee@catchpoint.com"]  # Your email for notifications
    }
  }
}
