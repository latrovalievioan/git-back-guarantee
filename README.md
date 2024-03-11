# 💸 Git back guarantee

`Gbg` allows you to transfer commit activity from a git repository using account `A` to a git repository using account `B`
without leaking sensitive information about repository `A`.

## 📋 Prerequisites
- Git
- Bash

## 📦 Setting up
For `gbg` to make sense, you need to have a work repository.

Let's say your work repository's `user.email` is `dev@work.com`.

What you want is to have another repository, one that is in your personal GitHub account cloned
(This repository will be the one in which we make mock commits to transfer the commit history).

Although it is not required, I strongly suggest that this personal repository is private.

Also don't forget to set the correct `user.email` and `user.name` in the local clone of the private
repository to your personal ones. You can do this by executing the following commands in the local clone:
```
$ git config user.email dev@personal.com
$ git config user.name Your Name
```

## 🚀 Usage
- Execute: 
```
$ bash ./gbg.sh
```
- You will get a prompt to enter the path to your work repository.
- You will be propmted to enter the path toyour personal commits repository.
- You will be prompted to enter the work repository branch from which you want to transfer commit activity.
- Voila, you just need to `cd` into the personal repository and execute `$ git push`.

## 📋 Todos:
- [ ] Stop prompting user to enter paths, use parameters instead.
- [ ] Compile to an executable.
- [ ] Better readme.
