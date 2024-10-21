# GitHub Organisation Provisioning

## Requirements

- Be able to add a new repository quickly and easily within our GitHub Organisation. We expect the configuration of these repositories to be largely the same, but we would like to be able to vary the followi
- ng:
- [X] Whether the repository is public or private
- [X] Whether the repository has:
  - [X] Issues
  - [X] Projects
  - [X] Discussions
  - [X] Wiki enabled
- 2 teams - Frontend and Backend. We need to be able to allocate users to either team. Additionally, the level of access to repositories will be different depending on which team someone is on.
- [X] Add example repos

## Solution(s)

### Teams

- [github_team](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team)
- [github_team_members](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_members)
- [github_team_membership](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_membership)

- [github_membership](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/membership)
  - required?

### Repo

- [github_repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)
  - Create and manage a repo
  - can select private/public
- [github_organization_project](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_project)

#### Repo project

- [repository_project](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_project)

## Link team & repo

- [github_team_repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository)
  - creates a relationship between the repo and a github_team resource
- [github_repository_collaborators](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborators)
  - can be used to define _all_ collaborators in a GH repo, can't be used with team repository