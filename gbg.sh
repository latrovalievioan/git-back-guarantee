#!/bin/sh

red='\033[0;31m'
cyan='\033[0;36m'   
nc='\033[0m'

read -e -p "Path to work repo: " work_repo_path
work_repo_path="${work_repo_path/#~/$HOME}"

read -e -p "Commit repo path (where the mock commits will happen): " commit_repo_path
commit_repo_path="${commit_repo_path/#~/$HOME}"

read -p "Branch (empty to use the current one): " branch

cd "$work_repo_path"
author=$(git config user.name)

if [[ -z $branch ]]; 
then
    branch=$(git branch --show-current)
else
    git switch $branch
fi

if [[ -z $commit_repo_path ]] || [[ -z $work_repo_path ]];
then
    echo -e "💩${red}Please specify correct repo paths!${nc}💩"
    exit 1
fi

echo -e "🚀${cyan}Mocking commits from $work_repo_path@$branch -> $commit_repo_path${nc}🚀"

dates=$(git log --committer="$author" --pretty="%ad")

git switch -

while IFS= read -r date; do
    cd $commit_repo_path
    echo $date >> $branch
    git add .
    GIT_AUTHOR_DATE="date -d '${date}'" GIT_COMMITTER_DATE="date -d '${date}'" git commit -m "$date" 
done <<< "$dates"
