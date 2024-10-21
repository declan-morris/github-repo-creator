resource "github_repository" "this" {
  for_each    = var.repos
  name        = each.value.name
  description = each.value.description

  visibility = each.value.visibility

  # config
  has_discussions = each.value.has_discussions
  has_issues      = each.value.has_issues
  has_projects    = each.value.has_projects
  has_wiki        = each.value.has_wiki
}

# resource "github_repository_project" "this" {
#   # ony create projects if the project is enabled for the repo
#   for_each = { for key, repo in var.repos : key => repo if repo.has_projects }

#   name       = each.value.name
#   repository = github_repository.this[each.key].name
# }

resource "github_repository_collaborators" "this" {
  # ony create collaborators if there are teams defined
  for_each = var.repos

  repository = each.value.name

  dynamic "team" {
    for_each = each.value.teams

    content {
      team_id    = github_team.this[team.value.team_name].slug
      permission = "pull"
    }
  }
}