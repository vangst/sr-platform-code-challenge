When a candidate submits their solution, the goal now is to restructure their git history and branches so that we can create a PR with their changes.

1. Download the submission and check out their working branch, probably `master`.
1. `git commit --allow-empty -m 'Empty commit'` - Create an empty commit after all their commits.
1. `git rebase -i --root` - Rebase all their commits, and move your empty commit to the beginning of the branch. You'll need to actually move your commit to the top of the list.
1. `git branch candidate-name` - Create a branch at the HEAD that you will contain all their work and be used as the PR branch. You should still be on `master` after this command.
1. ``git reset --hard `git rev-list --max-parents=0 HEAD | tail -n 1` `` - Reset the master branch to your empty commit.
1. `git remote add origin git@github.com:Vangsters/sr-platform-candidate-name.git` - Create a private repo on Github and add the remote to the candidate's git repo.
1. `git push --all` - Push all branches up to Github.
1. Create a PR with the `candidate-name` branch. Use the following template as the PR body, updating links if necessary:

```
## Senior Platform Engineer Submission

### Resources:

- [Challenge](https://github.com/Vangsters/sr-platform-code-challenge)
- [Rubric](https://github.com/Vangsters/sr-platform-code-challenge/blob/master/rubric.md)
- [JD](https://vangst.com/jobs/54dad8d6-092b-4974-be27-2459fff897cc)

### Submission email:

Contents of email or any other details.
```
