terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "~> 1.0"
    }
  }
}

resource "spacelift_stack" "blog_examples" {
  github_enterprise {
    namespace = "saturnhead"
  }
  autodeploy        = false
  branch            = "main"
  name              = "blog-examples"
  project_root      = "migration"
  repository        = "blog-examples"
  terraform_version = "1.5.3"

  # 8< --------------------------------------------------------------
  # Delete the following line after the stack has been created
  import_state_file = "/mnt/workspace/state-import/blog-examples.tfstate"
  # -------------------------------------------------------------- 8<
}


resource "spacelift_stack" "terraform_data" {
  github_enterprise {
    namespace = "saturnhead"
  }
  autodeploy        = false
  branch            = "main"
  name              = "terraform_data"
  project_root      = "migration"
  repository        = "blog-examples"
  terraform_version = "1.5.3"

  # 8< --------------------------------------------------------------
  # Delete the following line after the stack has been created
  import_state_file = "/mnt/workspace/state-import/terraform_data.tfstate"
  # -------------------------------------------------------------- 8<
}

