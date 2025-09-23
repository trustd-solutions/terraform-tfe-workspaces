terraform_cloud_org = "example-org"
workspaces = {
  "web-app" = {
    description                    = "Web application workspace with full configuration"
    environment                    = "production"
    project_name                   = "web-services"
    name                           = "custom-web-app-name"
    auto_apply                     = true
    auto_apply_run_trigger         = true
    queue_all_runs                 = false
    speculative_enabled            = true
    allow_destroy_plan             = false
    force_delete                   = false
    auto_destroy_activity_duration = "7d"
    remote_state_consumer_ids      = ["ws-123456789", "ws-987654321"]
    file_triggers_enabled          = true
    trigger_patterns               = ["modules/**", "environments/prod/**"]
    trigger_prefixes               = ["infrastructure/", "config/"]
    working_directory_prefix       = "terraform/environments"
    terraform_version              = "1.6.0"
    tag_names                      = ["production", "web-app", "critical"]
    tags = {
      "team"        = "platform"
      "cost-center" = "engineering"
      "environment" = "prod"
    }
    ignore_additional_tags        = false
    structured_run_output_enabled = true
    assessments_enabled           = true
    ssh_key_id                    = "sshkey-123456789"
    source_name                   = "custom-repo-name"
    source_url                    = "https://github.com/example/custom-repo"
    variable_set_names            = ["common-vars", "production-secrets", "web-app-config"]
    env_vars = {
      NODE_ENV     = "production"
      LOG_LEVEL    = "info"
      DATABASE_URL = "postgres://prod-db:5432/webapp"
      REDIS_URL    = "redis://prod-redis:6379"
    }
    terraform_vars = {
      region            = "us-east-1"
      instance_type     = "t3.large"
      min_capacity      = "2"
      max_capacity      = "10"
      enable_monitoring = "true"
    }
    vendors_vars = {
      datadog_api_key = "dd-api-key-123"
      newrelic_key    = "nr-key-456"
    }
    run_triggers = ["database-migration", "cache-invalidation"]
  }
}

vcs = {
  identifier         = "example-org/infrastructure-repo"
  branch             = "main"
  ingress_submodules = true
  oauth_token_id     = "ot-123456789abcdef"
  # github_app_installation_id = "ghaid-123456789" # Alternative to oauth_token_id
  tags_regex = "v\\d+\\.\\d+\\.\\d+"
}

workspace_settings = {
  agent_pool_id       = "apool-123456789"
  execution_mode      = "agent"
  global_remote_state = false
}
