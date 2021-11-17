vcs = {
  branch             = "main"
  identifier         = "foo/infrastructure"
  ingress_submodules = false
  oauth_token_id     = "ot-abc1234"
}

workspaces = {
  cloudtrail = {
    allow_destroy_plan        = true
    auto_apply                = true
    description               = "AWS CloudTrail Terraform Cloud Workspace"
    environment               = "dev"
    execution_mode            = "remote"
    global_remote_state       = true
    queue_all_runs            = false
    remote_state_consumer_ids = []
    tag_names                 = ["tag1", "tag2"]
    terraform_version         = "1.0.0"
    speculative_enabled       = true
    env_vars = {
      key  = "value",
      key1 = "value1",
    }
    sensitive_env_vars = {
      key  = "value",
      key1 = "value1",
    }
    terraform_vars = {
      key  = "value",
      key1 = "value1",
    }
    sensitive_terraform_vars = {
      key  = "value",
      key1 = "value1",
    }
  },
}
