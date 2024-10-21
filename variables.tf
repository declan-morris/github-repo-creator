variable "teams" {
  description = "A list of teams to be created and the team members that should be added to the teams"
  type = map(object({
    name         = string
    description  = string
    team_members = optional(set(string), [])
  }))
  default = {
    "frontend" = {
      name         = "Frontend Team", # maybe doesn't like spaces?
      description  = "The frontend team",
      team_members = ["decvox"]
    }
    "backend" = {
      name         = "Backend Team",
      description  = "The Backend team",
      team_members = ["decvox"]
    }
  }
}

variable "repos" {
  description = "A list of repos that should be created"
  type = map(object({
    name            = string
    description     = string
    visibility      = optional(string, "private")
    has_issues      = optional(bool, true)
    has_projects    = optional(bool, false)
    has_discussions = optional(bool, true)
    has_wiki        = optional(bool, true)
    teams = map(object({
      team_name   = string
      team_access = string # pull, push, triage, maintain, admin
    }))
  }))
  default = {
    "voxsmart-service-api" = {
      name        = "voxsmart-service-api"
      description = "Backend service for UI"
      visibility  = "private"
      teams = {
        "backend" = {
          team_name   = "backend"
          team_access = "maintain"
        }
        "frontend" = {
          team_name   = "frontend"
          team_access = "pull"
        }
      }
    }
    "voxsmart-service-ui" = {
      name        = "voxsmart-service-ui"
      description = "Frontend service"
      visibility  = "private"
      teams = {
        "frontend" = {
          team_name   = "frontend"
          team_access = "maintain"
        }
      }
    }
    "voxsmart-service-sdk" = {
      name         = "voxsmart-service-sdk"
      description  = "SDK"
      visibility   = "public"
      has_projects = true
      teams = {
        "backend" = {
          team_name   = "backend"
          team_access = "push"
        }
        "frontend" = {
          team_name   = "frontend"
          team_access = "push"
        }
      }
    }
  }

  # validation for visibility
}