resource "github_team" "this" {
  for_each    = var.teams
  name        = each.value.name
  description = each.value.description
  privacy     = "closed"
}

resource "github_team_members" "this" {
  for_each = var.teams
  team_id  = github_team.this[each.key].id

  dynamic "members" {
    for_each = each.value.team_members
    content {
      username = members.value
      role     = "maintainer"
    }
  }
}

# decided not to use github_team_membership, it will meet the requirement however github_team_members is more suitable as will remove users manually added