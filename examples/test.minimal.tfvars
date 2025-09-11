terraform_cloud_org = "example-org"
workspaces = {
  "api-service" = {
    description  = "Minimal API service workspace"
    environment  = "staging"
    project_name = "web-services"
    auto_apply   = false
    env_vars = {
      NODE_ENV = "staging"
    }
    terraform_vars = {
      region = "us-west-2"
    }
  }
  "database-migration" = {
    description  = "Database migration workspace"
    environment  = "production"
    project_name = "data-services"
    auto_apply   = false
    terraform_vars = {
      migration_version = "v2.1.0"
    }
  }
  "cache-invalidation" = {
    description  = "Cache invalidation workspace"
    environment  = "production"
    project_name = "infrastructure"
    auto_apply   = true
    env_vars = {
      CACHE_STRATEGY = "aggressive"
    }
  }
}
vcs = {
  identifier     = "example-org/infrastructure-repo"
  branch         = "main"
  oauth_token_id = "ot-123456789abcdef"
}

workspace_settings = {
  global_remote_state = true
}
