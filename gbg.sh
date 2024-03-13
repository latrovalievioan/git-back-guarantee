#!/usr/bin/env bash
set -e

red='\033[0;31m'
cyan='\033[0;36m'   
nc='\033[0m'

while getopts ":w:c:b:" opt; do
  case ${opt} in
    w )
      work_repo_path="${OPTARG/#~/$HOME}"
      ;;
    c )
      commit_repo_path="${OPTARG/#~/$HOME}"
      ;;
    b )
      branch="${OPTARG}"
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      exit 1
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

cd "$work_repo_path"
author=$(git config user.name)

if [[ -z $branch ]]; 
then
    branch=$(git branch --show-current)
else
    git switch $branch
    needsSwitch=true
fi

if [[ -z $commit_repo_path ]] || [[ -z $work_repo_path ]];
then
    echo -e "💩${red}Please specify correct repo paths!${nc}💩"
    exit 1
fi

echo -e "🚀${cyan}Mocking commits from $work_repo_path@$branch -> $commit_repo_path${nc}🚀"

dates=$(git log --committer="$author" --pretty="%ad")

if [[ -n $needsSwitch ]];
then
    git switch -
fi

while IFS= read -r date; 
do
    cd $commit_repo_path
    echo $date >> $branch
    git add .
    GIT_AUTHOR_DATE="date -d '${date}'" GIT_COMMITTER_DATE="date -d '${date}'" git commit -m "$date" 
done <<< "$dates"
