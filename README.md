# 💸 Git Back Guarantee

Git Back Guarantee is a tool designed to transfer commit activity from one Git repository to another,
allowing you to seamlessly move commit history from account `A` to account `B` without exposing sensitive information about repository `A`.

I'm sure you could have written this script yourself, however this one is for the lazy.

## 📋 Prerequisites
- Git
- Bash

## 📦 Setting up
To use `gbg`, ensure you have a work repository and a personal repository set up. Follow these steps:
1. Clone your personal repository from your GitHub account. *I strongly suggest that this repository is private.*
2. Set the `user.email` and `user.name` in the local clone of the personal repository to your personal credentials:
```bash
git config user.email dev@personal.com
git config user.name Your Name
```

## 🚀 Usage
1. Run the following command:
```bash
bash ./gbg.sh
```
2. Enter the path to your work repository when prompted.
3. Enter the path to your personal commits repository when prompted.
4. Specify the branch from your work repository that you want to transfer commit activity from (leave empty to use the current branch).
5. Navigate to your personal repository and execute:
```bash
git push
```

## 📋 Todos:
- [ ] Refactor to use parameters instead of prompting for paths.
- [ ] Compile to an executable for easier usage.
