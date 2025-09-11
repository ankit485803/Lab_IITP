

src:  https://cli.github.com/  and  https://cli.github.com/manual/gh


1.
🔹 PR & Code Review Management
| Command                             | Description                                                |
| ----------------------------------- | ---------------------------------------------------------- |
| `gh pr list`                        | See open PRs in the current repo                           |
| `gh pr view`                        | View details of a PR (title, description, files, comments) |
| `gh pr checkout <number or branch>` | Checkout a PR branch locally                               |
| `gh pr create`                      | Create a new PR from CLI                                   |
| `gh pr status`                      | See your current PRs, review requests, assignments         |
| `gh pr comment <number>`            | Add a comment to a PR (great for code reviews)             |
| `gh pr merge <number>`              | Merge a PR (can do `--merge`, `--squash`, `--rebase`)      |




2
🔹 Issues & Bug Tracking
| Command                     | Description               |
| --------------------------- | ------------------------- |
| `gh issue list`             | List open issues          |
| `gh issue view <number>`    | View details of an issue  |
| `gh issue create`           | Create a new issue        |
| `gh issue comment <number>` | Add a comment to an issue |
| `gh issue close <number>`   | Close an issue            |


3
🔹 Repo Management
| Command                        | Description                               |
| ------------------------------ | ----------------------------------------- |
| `gh repo view`                 | See details of the current repo           |
| `gh repo clone <owner>/<repo>` | Clone a GitHub repo quickly               |
| `gh repo fork`                 | Fork a repo                               |
| `gh repo create`               | Create a new GitHub repo (public/private) |


4
🔹 Label, Assignee, and Reviewer Automation
| Command                                     | Description                      |
| ------------------------------------------- | -------------------------------- |
| `gh pr edit <number> --add-label <label>`   | Add labels to a PR               |
| `gh pr edit <number> --add-assignee <user>` | Assign someone to a PR           |
| `gh pr edit <number> --add-reviewer <user>` | Request code review from someone |


5 
git rebase -i → Rewrite clean commit history
git cherry-pick → Copy specific commits between branches
git stash → Save changes temporarily
git bisect → Find bugs between commits
git log --oneline --graph → Visualize branch history


6







another
| Skill Area           | Tools / Practices                                                |
| -------------------- | ---------------------------------------------------------------- |
| **Version Control**  | Deep git (`rebase`, `cherry-pick`, `bisect`) and `gh`            |
| **Automation**       | Use GitHub Actions, shell scripts, Makefiles                     |
| **Code Quality**     | Learn `linting`, `unit testing`, `CI/CD pipelines`               |
| **DevOps Awareness** | Docker, cloud CLI tools (AWS CLI, Azure CLI)                     |
| **Documentation**    | Write good PRs, README files, and inline comments                |
| **System Design**    | Read about scalable system patterns (queues, caching, databases) |
