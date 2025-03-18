# Version 1.3.0

local Z_CONFIG_FILE=~/.zprofile_config

local Z_PACKAGE_MANAGER=${$(sed -n 's/^Z_PACKAGE_MANAGER=\([^ ]*\)/\1/p' $Z_CONFIG_FILE):-npm run}
local Z_RUN_DEV=${$(sed -n 's/^Z_RUN_DEV=\([^ ]*\)/\1/p' $Z_CONFIG_FILE):-npm run dev}
local Z_PROJECT_FOLDER_=$(sed -n 's/^Z_PROJECT_FOLDER=\([^ ]*\)/\1/p' "$Z_CONFIG_FILE")
local Z_PROJECT_FOLDER=$(realpath "$(eval echo $Z_PROJECT_FOLDER_)")
local Z_PROJECT_REPO=$(sed -n 's/^Z_PROJECT_REPO=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PROJECT_SHORT_NAME=${$(sed -n 's/^Z_PROJECT_SHORT_NAME=\([^ ]*\)/\1/p' $Z_CONFIG_FILE):-my}
local Z_SETUP_SCRIPT=${$(sed -n 's/^Z_SETUP_SCRIPT=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)-:npm i}
local Z_SETUP_COMMAND=$(sed -n 's/^Z_SETUP_COMMAND=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_SETUP_BASH_SCRIPT_PATH=$(eval echo $(sed -n 's/^Z_SETUP_BASH_SCRIPT_PATH=\([^ ]*\)/\1/p' $Z_CONFIG_FILE))
local Z_PULL_REQUEST_TEMPLATE=$(sed -n 's/^Z_PULL_REQUEST_TEMPLATE=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_REPLACE=$(sed -n 's/^Z_PR_REPLACE=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_APPEND=$(sed -n 's/^Z_PR_APPEND=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_RUN_TEST=$(sed -n 's/^Z_PR_RUN_TEST=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)

if [ -z $Z_PROJECT_FOLDER ]; then
	Z_PROJECT_FOLDER=${Z_PROJECT_FOLDER:-~}
	echo "\e[33mwarn:\e[0m Z_PROJECT_FOLDER was not set, default to '$Z_PROJECT_FOLDER' - type \e[93mhelp\e[0m for more"
fi

if [ ! -d "$Z_PROJECT_FOLDER" ]; then
	echo "\e[33mwarn:\e[0m cannot locate Z_PROJECT_FOLDER=$Z_PROJECT_FOLDER"
	Z_PROJECT_FOLDER=~
	echo "\e[33mwarn:\e[0m switched to Z_PROJECT_FOLDER=$Z_PROJECT_FOLDER"
fi

help() {
	tput reset

	local TITLE_COR="\e[37m"
	local COMMAND_COR="\e[33m"
	local PROJECT_COR="\e[34m"
	local PACKAGE_COR="\e[35m"
	local GIT_COR="\e[36m"

	echo "$TITLE_COR -- general ------------------------------------------------- \e[0m"
	echo " $COMMAND_COR cl \e[0m\t\t = clear"
	echo " $COMMAND_COR del \$1\e[0m\t = delete path"
	echo " $COMMAND_COR hg \$1 \e[0m\t = history | grep \$1"
	echo " $COMMAND_COR kill \$1 \e[0m\t = kill port \$1"
	echo " $COMMAND_COR ll \e[0m\t\t = ls -laF"
	echo " $COMMAND_COR nodei \e[0m\t = info about node"
	echo " $COMMAND_COR nlist \e[0m\t = npm list global"
	echo " $COMMAND_COR path \e[0m\t\t = echo \$PATH"
	echo " $COMMAND_COR refresh \e[0m\t = source .zshrc + .zprofile"
	echo " $COMMAND_COR update \e[0m\t = update zsh + omp"
	echo "$TITLE_COR -- $Z_PROJECT_SHORT_NAME ----------------------------------------------------- \e[0m"
	echo " $PROJECT_COR $Z_PROJECT_SHORT_NAME \e[0m\t\t = cd $Z_PROJECT_FOLDER_"
	echo " $PROJECT_COR clonep \$1\e[0m\t = clone $Z_PROJECT_SHORT_NAME to folder"
	echo " $PROJECT_COR setup \e[0m\t = $Z_SETUP_SCRIPT + Z_SETUP_COMMAND"
	echo " $PROJECT_COR rev \$1\e[0m\t = review $Z_PROJECT_SHORT_NAME branch"
	echo " $PROJECT_COR rev+ \$1\e[0m\t = find and review $Z_PROJECT_SHORT_NAME branch"
	echo " $PROJECT_COR run \e[0m\t\t = Z_RUN_DEV"
	echo " $PROJECT_COR run \$1 \e[0m\t = run project in $(basename "$(realpath "$(eval echo "$Z_PROJECT_FOLDER/../")")")"
	echo "$TITLE_COR -- $Z_PACKAGE_MANAGER ---------------------------------------------------- \e[0m"
	echo " $PACKAGE_COR build \e[0m\t = $Z_PACKAGE_MANAGER build"
	echo " $PACKAGE_COR cov \e[0m\t\t = $Z_PACKAGE_MANAGER test:coverage"
	echo " $PACKAGE_COR e2e \e[0m\t\t = $Z_PACKAGE_MANAGER test:e2e"
	echo " $PACKAGE_COR e2e \$1 \e[0m\t = $Z_PACKAGE_MANAGER test:e2e project \$1"
	echo " $PACKAGE_COR e2eui \e[0m\t = $Z_PACKAGE_MANAGER test:e2e:ui"
	echo " $PACKAGE_COR fix \e[0m\t\t = $Z_PACKAGE_MANAGER lint + $Z_PACKAGE_MANAGER format"
	echo " $PACKAGE_COR format \e[0m\t = $Z_PACKAGE_MANAGER format"
	echo " $PACKAGE_COR i \e[0m\t\t = $Z_PACKAGE_MANAGER install"
	echo " $PACKAGE_COR lint \e[0m\t\t = $Z_PACKAGE_MANAGER lint"
	echo " $PACKAGE_COR rdev \e[0m\t\t = $Z_PACKAGE_MANAGER dev"
	echo " $PACKAGE_COR sb \e[0m\t\t = $Z_PACKAGE_MANAGER storybook"
	echo " $PACKAGE_COR sbb \e[0m\t\t = $Z_PACKAGE_MANAGER storybook:build"
	echo " $PACKAGE_COR start \e[0m\t = $Z_PACKAGE_MANAGER start"
	echo " $PACKAGE_COR test \e[0m\t\t = $Z_PACKAGE_MANAGER test"
	echo " $PACKAGE_COR tsc \e[0m\t\t = $Z_PACKAGE_MANAGER tsc"
	echo " $PACKAGE_COR watch \e[0m\t = $Z_PACKAGE_MANAGER test:watch"
	echo "$TITLE_COR -- git ----------------------------------------------------- \e[0m"
	echo " $GIT_COR add \$1\e[0m\t = Add files to index"
	echo " $GIT_COR clone \$1 \$2\e[0m\t = clone project to folder"
	echo " $GIT_COR commit \$1\e[0m\t = commit message"
	echo " $GIT_COR commita \$1\e[0m\t = add + commit message"
	echo " $GIT_COR delb \e[0m\t\t = delete branch selectively locally"
	echo " $GIT_COR delb \$1\e[0m\t = delete branch locally"
	echo " $GIT_COR fetch \e[0m\t = git fetch all"
	echo " $GIT_COR gconf \e[0m\t = git config"
	echo " $GIT_COR glog \e[0m\t\t = git log"
	echo " $GIT_COR pr \$1\e[0m\t\t = create pull request with labels \$1"
	echo " $GIT_COR prune \e[0m\t = delete merged branches locally"
	echo " $GIT_COR pull \e[0m\t\t = git pull all"
	echo " $GIT_COR push \e[0m\t\t = git push no-verify + tags"
	echo " $GIT_COR pushf \e[0m\t = git push + force"
	echo " $GIT_COR stash \$1 \e[0m\t = stash all files"
	echo " $GIT_COR st \e[0m\t\t = git status"
	echo " $GIT_COR tag \$1\e[0m\t = create tag"
	echo " $GIT_COR ltag \e[0m\t\t = display latest tag"
	echo " $GIT_COR tags \e[0m\t\t = list all tags"
	echo "$TITLE_COR -- git clean branch ---------------------------------------- \e[0m"
	echo " $GIT_COR clean\e[0m\t\t = git clean + restore"
	echo " $GIT_COR reset \$1\e[0m\t = unstage files or all"
	echo " $GIT_COR reseta \e[0m\t = git reset hard"
	echo " $GIT_COR reset1 \e[0m\t = git reset soft HEAD~1"
	echo " $GIT_COR reset2 \e[0m\t = git reset soft HEAD~2"
	echo " $GIT_COR reset3 \e[0m\t = git reset soft HEAD~3"
	echo " $GIT_COR reset4 \e[0m\t = git reset soft HEAD~4"
	echo " $GIT_COR reset5 \e[0m\t = git reset soft HEAD~5"
	echo "$TITLE_COR -- git list branch ----------------------------------------- \e[0m"
	echo " $GIT_COR gll \e[0m\t\t = list local branches"
	echo " $GIT_COR gll \$1 \e[0m\t = list local branches matching \$1"
	echo " $GIT_COR glr \e[0m\t\t = list remote branches"
	echo " $GIT_COR glr \$1 \e[0m\t = list remote branches matching \$1"
	echo "$TITLE_COR -- git merge branch ---------------------------------------- \e[0m"
	echo " $GIT_COR abort\e[0m\t\t = abort rebase/merge"
	echo " $GIT_COR chc \e[0m\t\t = continue cherry pick"
	echo " $GIT_COR chp \$1 \e[0m\t = cherry pick commit"
	echo " $GIT_COR mc \e[0m\t\t = continue merge"
	echo " $GIT_COR merge \e[0m\t = merge from default branch"
	echo " $GIT_COR merge \$1 \e[0m\t = merge from branch"
	echo " $GIT_COR rc \e[0m\t\t = continue rebase"
	echo " $GIT_COR rebase \e[0m\t = rebase from default branch"
	echo " $GIT_COR rebase \$1 \e[0m\t = rebase from branch"
	echo "$TITLE_COR -- git switch branch --------------------------------------- \e[0m"
	echo " $GIT_COR ck \$1 \e[0m\t = checkout branch"
	echo " $GIT_COR ck+ \$1 \e[0m\t = find branch and checkout"
	echo " $GIT_COR ck \$1 \$2 \e[0m\t = create branch off of \$2"
	echo " $GIT_COR ck+ \$1 \$2 \e[0m\t = find and create branch off of \$2"
	echo " $GIT_COR dev \e[0m\t\t = checkout dev branch"
	echo " $GIT_COR main \e[0m\t\t = checkout default/main branch"
}

# General
alias cl="tput reset"
alias hg="history | grep" # $1
alias kill="npx kill-port" # $1
alias ll="ls -laF"
alias nodei="node -e 'console.log(process.version, process.arch, process.platform)'"
alias nlist="npm list --global --depth=0"
alias path="echo $PATH"
alias refresh="source ~/.zshrc && source ~/.zprofile && clear"
alias update="omz update && oh-my-posh upgrade"


checkgit() {
	if [ ! -d ".git" ]; then
		echo "fatal: not a git repository (or any of the parent directories): .git"
		# echo "\e[31mfatal:\e[0m not a git repository: $(pwd)"
		return 1;
	fi
}

# Deleting a path ===============================================================
del() {
	if [ -z $1 ]; then
		echo "\e[93mdel <path> to delete a folder or file\e[0m"
		return 0;
	fi

	local PATH_1=$(eval echo $1)

	if [ ! -e $PATH_1 ]; then
		echo "\e[31mfatal:\e[0m  no such file or directory"
		return 0;
	fi

	local FOLDER_PATH=$(realpath "$1")
	if [ ! $? -eq 0 ]; then return 0; fi

	local PARENT_FOLDER=$(dirname "$1")
	if [ ! $? -eq 0 ]; then return 0; fi

	local PARENT_PATH=$(realpath "$PARENT_FOLDER")
	if [ ! $? -eq 0 ]; then return 0; fi

	local CURRENT_PATH=$(realpath "$PWD")
	if [ ! $? -eq 0 ]; then return 0; fi

	local FLAG=0

	if read -qs "?delete "$'\e[94m'$FOLDER_PATH$'\e[0m'" (y/n) "; then
    echo "y"
  else
  	echo "n"
  	return 0;
  fi

	if [[ "$FOLDER_PATH" == "$CURRENT_PATH" ]]; then
		echo "\e[33mwarn:\e[0m deleting current folder...\n"
		FLAG=1
	fi

	if [[ -e "$FOLDER_PATH" ]]; then
		rm -rf "$FOLDER_PATH"
	else
		echo "\e[31mfatal:\e[0m does not exist: '$FOLDER_PATH'\n"
	fi

	if [[ $FLAG -eq 1 ]]; then
		cd "$PARENT_PATH"
	fi

	ls "$PARENT_PATH"
}

# Project
alias build="$Z_PACKAGE_MANAGER build"
alias e2eui="$Z_PACKAGE_MANAGER test:e2e:ui"
alias fix="$Z_PACKAGE_MANAGER lint && $Z_PACKAGE_MANAGER format"
alias format="$Z_PACKAGE_MANAGER format"
alias i="$Z_PACKAGE_MANAGER install"
alias lint="$Z_PACKAGE_MANAGER lint"
alias rdev="$Z_PACKAGE_MANAGER dev"
alias test="$Z_PACKAGE_MANAGER test"
alias tsc="$Z_PACKAGE_MANAGER tsc"
alias sb="$Z_PACKAGE_MANAGER storybook"
alias sbb="$Z_PACKAGE_MANAGER storybook:build"
alias start="$Z_PACKAGE_MANAGER start"
alias watch="$Z_PACKAGE_MANAGER test:watch"
alias $Z_PROJECT_SHORT_NAME="cd $Z_PROJECT_FOLDER"

cov() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	mkdir -p coverage
	$Z_PACKAGE_MANAGER test:coverage --colors > coverage/report.ansi
	open ./coverage/report.ansi -a "Sublime Text"
}

e2e() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	if [ -z $1 ]; then
		eval $Z_PACKAGE_MANAGER test:e2e
	else
		eval $Z_PACKAGE_MANAGER test:e2e --project $1
	fi
}

# Creating PRs =============================================================
pr() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	local STATUS=$(git status --porcelain)

	if [[ -n "$STATUS" ]]; then
		echo "\e[33mwarn:\e[0m there's work in progress, execute: \e[93mpush\e[0m, \e[93mpushf\e[0m, \e[93mclean\e[0m or \e[93mreseta\e[0m"
		return 0
	fi

	# Initialize an empty string to store the commit details
	local COMMIT_MSGS=""
	local PR_TITLE=""

	local REMOTE_BRANCH=$(git for-each-ref --format='%(upstream:short)' "$(git symbolic-ref -q HEAD)" origin/mainline)

	# Get the current branch name
	local CURRENT_BRANCH=$(git branch --show-current)

	# Local branch has been pushed to remote
	if [[ -n "$REMOTE_BRANCH" ]]; then
		# Get the current user's name (author)
		local current_author=$(git config --get user.email)
		# Get the current commit hash where origin/HEAD is pointing
		local origin_head_commit=$(git rev-parse origin/HEAD)

		# Loop through all commits in the current branch using git log (newest to oldest)
		git log --pretty=format:'%H | %ae | %s' $CURRENT_BRANCH | while IFS= read -r line; do
		    # Extract commit hash, commit author, and commit message using the '|' separator
	    local commit_hash=$(echo "$line" | cut -d'|' -f1 | xargs)
	    local commit_author=$(echo "$line" | cut -d'|' -f2 | xargs)
	    local commit_message=$(echo "$line" | cut -d'|' -f3- | xargs)

			# Check if the commit belongs to the current branch
			if ! git branch --contains "$commit_hash" | grep -q "\b$CURRENT_BRANCH\b"; then
			  break
			fi

	    # Stop if the commit is the origin/HEAD commit
	    if [[ "$commit_hash" == "$origin_head_commit" ]]; then
	        break
	    fi
	    # Check if the commit's author matches the current user
	    if [[ "$commit_author" != "$current_author" ]]; then
	        break
	    fi

			PR_TITLE="$commit_message"

	    # Add the commit hash and message to the list
	    COMMIT_MSGS+="- $commit_hash - $commit_message"$'\n'
		done
	else
		# Local branch has not yet been pushed to remote

		# Loop through all commits in the current branch using git log (newest to oldest)
		git log --branches --not --remotes --oneline --pretty=format:'%H | %s' | while IFS= read -r line; do
	    local commit_hash=$(echo "$line" | cut -d'|' -f1 | xargs)
	    local commit_message=$(echo "$line" | cut -d'|' -f2- | xargs)

		  # # Use grep with a regular expression to find all branches referencing the commit hash
			# local branches=$(grep -R "$commit_hash" .git/refs/heads | sed 's|.*/heads/||' | cut -d: -f1 | sed 's|$|\||')

			# if ! echo "$branches" | grep -q "$CURRENT_BRANCH|"; then
			# 	break
			# fi
			# Check if the commit belongs to the current branch
			if ! git branch --contains "$commit_hash" | grep -q "\b$CURRENT_BRANCH\b"; then
			  break
			fi

			PR_TITLE="$commit_message"

	    # Add the commit hash and message to the list
			COMMIT_MSGS+="- $commit_hash - $commit_message"$'\n'
		done
	fi

	if [[ ! -n "$COMMIT_MSGS" ]]; then
		echo "\e[33mwarn:\e[0m no commits, no work was done"
		return 0;
	fi

	local PR_BODY="$COMMIT_MSGS"

	if [ -f "$Z_PULL_REQUEST_TEMPLATE" ]; then
		local PR_TEMPLATE=$(cat $Z_PULL_REQUEST_TEMPLATE)

		if [ $Z_PR_APPEND -eq 1 ]; then
			# Append commit msgs right after Z_PR_REPLACE in pr template
			PR_BODY=$(echo "$PR_TEMPLATE" | perl -pe "s/(\Q$Z_PR_REPLACE\E)/\1\n\n$COMMIT_MSGS\n/")
		else
			# Replace Z_PR_REPLACE with commit msgs in pr template
			PR_BODY=$(echo "$PR_TEMPLATE" | perl -pe "s/\Q$Z_PR_REPLACE\E/$COMMIT_MSGS/g")
		fi
	fi

  # # debugging purposes
	# echo "PR_TITLE: $PR_TITLE"
	# echo "$PR_BODY"
	# return 0;

	if [ $Z_PR_RUN_TEST -eq 1 ]; then
		test

		if [ ! $? -eq 0 ]; then
			echo "\e[33m\nfatal: tests are not passing! cannot push!\e[0m"
			return 0;
		fi
	fi

	push

	local MY_BRANCH=$(git branch --show-current)

	if [ -z $1 ]; then
		gh pr create -a @me --title $PR_TITLE --body $PR_BODY --web --head $MY_BRANCH
	else
		gh pr create -a @me --title $PR_TITLE --body $PR_BODY --web --head $MY_BRANCH --label $1 
	fi
}

run() {
	if [ -z "$1" ]; then
		checkgit; if [ ! $? -eq 0 ]; then return 0; fi

		eval $Z_RUN_DEV
	else
		local PROJECT=$(realpath "$(eval echo "$Z_PROJECT_FOLDER/../$1")")

		if [ ! -d "$PROJECT" ]; then
			echo "\e[31mfatal:\e[0m not a project: $PROJECT"
			return 0;
		fi

		cd "$PROJECT"
		echo "opened $(pwd)"
		setup
		dev
	fi
}

rev+() {
	if [ -z $1 ]; then
		echo "find matching branch and create review: \e[93mrev+ <branch>\e[0m"
		echo "create review from exact branch: \e[93mrev <branch>\e[0m"
		echo "list reviews to open: \e[93mrev\e[0m"
	else
		rev $1\*
	fi
}

setup() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	eval $Z_SETUP_SCRIPT
	eval $Z_SETUP_COMMAND

	if [ ! -z $Z_SETUP_BASH_SCRIPT_PATH ]; then
		if [ -f "$Z_SETUP_BASH_SCRIPT_PATH" ]; then
			bash "$Z_SETUP_BASH_SCRIPT_PATH"
		else
			echo "\e[33mwarn:\e[0m file not found: Z_SETUP_BASH_SCRIPT_PATH=$Z_SETUP_BASH_SCRIPT_PATH"
		fi
	fi
}

# Clone =====================================================================
# review a branch
rev() {
	if [ -z $1 ]; then
		mkdir -p "$Z_PROJECT_FOLDER/../revs"
		cd "$Z_PROJECT_FOLDER/../revs"
	  
	  local REVS=$(ls -d rev*)

	  if [ -z "$REVS" ]; then
			echo "create review from exact branch: \e[93mrev <branch>\e[0m"
			echo "find matching branch and create review: \e[93mrev+ <branch>\e[0m"
			return 0;
	  fi

	  echo "list of reviews:";
	  PS3="select option: ";

	  REVS=($REVS "quit")

	  select CHOICE in "${REVS[@]}"; do
	    case $CHOICE in
        "quit")
        	break
          ;;
      *)
      		cd "$CHOICE"

      		local STATUS=$(git status --porcelain)
					if [[ -z $STATUS ]]; then # clean status
						pull
						i
					fi

      		code .
      		break
          ;;
	    esac
		done

		return 0;
	fi

	if [ ! -d ".git" ]; then
		eval $Z_PROJECT_SHORT_NAME
	fi

	local BRANCH="$1"

	if [[ "$BRANCH" == *\* ]]; then
	  # Remove the "*" from the end of $1
		BRANCH="${BRANCH//\*/}"
		BRANCH=$(git branch -r --list | grep -w "$BRANCH" | sed 's/^[* ]*//g' | sed -e 's/remotes\///' | sed -e 's/origin\///' | head -n 1)
	fi

	if [[ ! -n "$BRANCH" ]]; then
		echo "\e[31mfatal:\e[0m did not match any branch known to git: $1"
		return 0;
	fi

	echo "code review on branch: \e[94m$BRANCH\e[0m"

	mkdir -p "$Z_PROJECT_FOLDER/../revs"
	cd "$Z_PROJECT_FOLDER/../revs"

	local BRANCH_PATH=""

	if [ ! -d "$Z_PROJECT_FOLDER/../revs/rev.$BRANCH" ]; then
  	BRANCH_PATH="$Z_PROJECT_FOLDER/../revs/rev.$BRANCH"
  else
		for i in {2..20}; do
			if [ ! -d "$Z_PROJECT_FOLDER/../revs/rev$i.$BRANCH" ]; then
				BRANCH_PATH="$Z_PROJECT_FOLDER/../revs/rev$i.$BRANCH"
				break;
			fi
		done
	fi

	clonep "$BRANCH_PATH" $BRANCH
	setup
  code .
}

# clone my project to path relative to project_folder/.. and checkout branch $2
clonep() {
	if [ -z $1 ]; then
		echo "clone project in path: \e[93mclonep <path>\e[0m"
		echo "clone project in path and checkout branch: \e[93mclonep <path> <branch>\e[0m"
		return 0;
	fi

	cd "$Z_PROJECT_FOLDER/.."
  git clone $Z_PROJECT_REPO "$1"
	if [ ! $? -eq 0 ]; then return 0; fi

  cd "$1"
	echo "opened $(pwd)"

	if [ ! -z $2 ]; then
		ck $2
	fi
}

# simple clone any project to path
clone() {
	if [ -z $1 ]; then
		echo "clone git repository into path: \e[93mclone <uri> [<path>]\e[0m"
		return 0;
	fi

	cd "$Z_PROJECT_FOLDER/.."

	# Extract the project name (repository name) from the Git URL
	local PROJECT_NAME=$(basename "$1" .git)

	# If the URL is using SSH (git@github.com:...) remove the "git@" and ":"
	if [[ "$1" == git@* ]]; then
		PROJECT_NAME=$(echo "$PROJECT_NAME" | sed 's/^.*://')
	fi

	if [ -z $2 ]; then
  	git clone $1 "$PROJECT_NAME"
		if [ ! $? -eq 0 ]; then return 0; fi

  	cd "$PROJECT_NAME"
  	echo "opened $(pwd)"
  else
  	git clone $1 "$2"
		if [ ! $? -eq 0 ]; then return 0; fi

  	cd "$2"
  	echo "opened $(pwd)"
	fi
}

# Git =========================================================================
alias add="git add" # $1
alias chc="git cherry-pick --continue"
alias chp="git cherry-pick" # $1
alias clean="git clean -fd -q && git restore -q ."
alias fetch="git fetch --tags --all"
alias pull="git pull --tags --all"
alias pushf="git push --no-verify --tags --force-with-lease"
alias glog="clear && git log -15 --graph --abbrev-commit --pretty=format:'%C(magenta)%h%Creset ~%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias mc="git add . && git merge --continue"
alias rc="git add . && git rebase --continue"
alias reset1="git reset --soft HEAD~1"
alias reset2="git reset --soft HEAD~2"
alias reset3="git reset --soft HEAD~3"
alias reset4="git reset --soft HEAD~4"
alias reset5="git reset --soft HEAD~5"
alias st="git status"

gconf() {
	echo "\e[33mUsername:\e[0m $(git config --get user.name)"
	echo "\e[33mEmail:\e[0m $(git config --get user.email)"
	echo "\e[33mDefault branch:\e[0m $(git config --get init.defaultBranch)"
}

abort() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	GIT_EDITOR=true git rebase --abort
	GIT_EDITOR=true git merge --abort
}

# Commits =======================================================================
commita() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	if [ -z $1 ]; then
		echo "stage and commit all files with message: \e[93mcommit <message>\e[0m"
		return 0;
	fi

	git add --all
	git commit --no-verify --message "$1"
}

commit() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	if [ -z $1 ]; then
		echo "commit staged files with message: \e[93mcommit <message>\e[0m"
		return 0;
	fi

	git commit --no-verify --message "$1"
}

push() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	local MY_BRANCH=$(git branch --show-current)

	git push --no-verify --tags --set-upstream origin $MY_BRANCH
}

stash() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	git stash push --include-untracked --message "${1:-.}"
}

tag() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	if [[ -z $1 ]]; then
		echo "create a new tag: \e[93mtag <name>\e[0m"
		echo "display last tag: \e[93mltag\e[0m"
		echo "display all tags: \e[93mtags\e[0m"
		return 0;
	fi

	git tag --annotate $1 --message $1
}

ltag() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	tags 1
}

tags() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	git fetch --quiet --tags --prune --prune-tags

	local TAG=""

	if [[ -z $1 ]]; then
		TAG=$(git for-each-ref refs/tags --sort=-taggerdate --format='%(refname:short)')

		if [[ -z $TAG ]]; then
			TAG=$(git for-each-ref refs/tags --sort=-committerdate --format='%(refname:short)')
		fi
	else
		TAG=$(git for-each-ref refs/tags --sort=-taggerdate --format='%(refname:short)' --count=$1)

		if [[ -z $TAG ]]; then
			TAG=$(git for-each-ref refs/tags --sort=-committerdate --format='%(refname:short)' --count=$1)
		fi
	fi

	if [[ -z $TAG ]]; then
		echo "no tags found"
	else
		echo $TAG
	fi
}

reset() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

  git restore --staged "${1:-.}"
}

reseta() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	local MY_BRANCH=$(git branch --show-current)

	git reset --hard origin/$MY_BRANCH
	git restore -q .
	git clean -fd -q
	git pull -q
}

# List branches =======================================================================
# list remote branches that contains an optional text and adds a link to the branch in github
glr() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	git branch -r --list "*$1*" --sort=authordate --format='%(authordate:format:%m-%d-%Y) %(align:17,left)%(authorname)%(end) %(refname:strip=3)' | sed \
    -e 's/\([0-9]*-[0-9]*-[0-9]*\)/\x1b[32m\1\x1b[0m/' \
    -e 's/\([^\ ]*\)$/\x1b[34m\x1b]8;;https:\/\/github.com\/wmgtech\/wmg2-one-app\/tree\/\1\x1b\\\1\x1b]8;;\x1b\\\x1b[0m/'
}

# list only local branches that contains an optional text
gll() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	git branch --list "*$1*" --sort=authordate --format="%(authordate:format:%m-%d-%Y) %(align:17,left)%(authorname)%(end) %(refname:strip=2)" | sed \
		-e 's/\([0-9]*-[0-9]*-[0-9]*\)/\x1b[32m\1\x1b[0m/' \
	  -e 's/\([^ ]*\)$/\x1b[34m\1\x1b[0m/'
}


# Switch branches =======================================================================
# check out a branch or create a new one if $2 is given
ck+() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	if [ -z $1 ]; then
	  echo "find matching branch and checkout: \e[93mck+ <branch>\e[0m"
	  echo "create exact branch off of matching base branch: \e[93mck+ <branch>\e[0m \e[33m<base_branch>\e[0m"
		echo "checkout exact branch: \e[93mck <branch>\e[0m"
	  echo "create exact branch off of exact base branch: \e[93mck <branch>\e[0m \e[33m<base_branch>\e[0m"
	else
		if [ -z $2 ]; then
			ck $1\*
		else
			ck $1\* $2\*
		fi
	fi
}

ck() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	if [ -z $1 ]; then
		echo "checkout exact branch: \e[93mck <branch>\e[0m"
	  echo "create exact branch off of exact base branch: \e[93mck <branch>\e[0m \e[33m<base_branch>\e[0m"
	  echo "find matching branch and checkout: \e[93mck+ <branch>\e[0m"
	  echo "create exact branch off of matching base branch: \e[93mck+ <branch>\e[0m \e[33m<base_branch>\e[0m"
		return 0;
	fi

	local STATUS=$(git status --porcelain)
	if [[ -n "$STATUS" ]]; then # clean status
		echo "\e[33mwarn:\e[0m there's work in progress, execute: \e[93mpush\e[0m, \e[93mpushf\e[0m, \e[93mclean\e[0m or \e[93mreseta\e[0m"
		return 0;
	fi

	if [[ $1 == -* ]]; then
		git checkout $1 $2 $3

		return 0;
	fi

	local BRANCH="$1"

	if [ -z $2 ]; then	
		if [[ "$BRANCH" == *\* ]]; then
		  # Remove the "*" from the end of $1
		  BRANCH="${BRANCH//\*/}"
		  # look for a branch locally before lookin g remotely
			BRANCH=${$(git branch --list | grep -w "$BRANCH" | sed 's/^[* ]*//g' | sed -e 's/remotes\///' | sed -e 's/origin\///' | head -n 1):-$(git branch -r --list | grep -w "$BRANCH" | sed 's/^[* ]*//g' | sed -e 's/remotes\///' | sed -e 's/origin\///' | head -n 1)}
		fi

		if [[ ! -n "$BRANCH" ]]; then
			echo "\e[31mfatal:\e[0m could not find branch matching: \e[94m$1\e[0m"
			return 0;
		fi
	
		local MY_BRANCH=$(git branch --show-current)

		if [[ "$MY_BRANCH" == "$BRANCH" ]]; then
			echo "current branch is \e[94m$BRANCH\e[0m";
			return 0;
		fi

		git checkout $BRANCH --quiet

		if [ $? -eq 0 ]; then
			if [[ "$MY_BRANCH" != "$BRANCH" ]]; then
				echo "switched to branch: \e[94m$BRANCH\e[0m";
			fi
		fi

		return 0;
	fi

	local USER_BASE_BRANCH="$2"

	if [[ "$BRANCH" == *\* ]]; then
	  # Remove the "*" from the end of $1
	  BRANCH="${BRANCH//\*/}"
	fi

	if [[ "$USER_BASE_BRANCH" == *\* ]]; then
	  # Remove the "*" from the end of $1
	  local USER_BASE_BRANCH_SEARCH="${USER_BASE_BRANCH//\*/}"
	  # look for a branch locally before looking remotely
		USER_BASE_BRANCH=${$(git branch --list | grep -w "$USER_BASE_BRANCH_SEARCH" | sed 's/^[* ]*//g' | sed -e 's/remotes\///' | sed -e 's/origin\///' | head -n 1):-$(git branch -r --list | grep -w "$USER_BASE_BRANCH_SEARCH" | sed 's/^[* ]*//g' | sed -e 's/remotes\///' | sed -e 's/origin\///' | head -n 1)}
	fi

	# if $2 was given, let's create a new branch
	if [[ -n "$USER_BASE_BRANCH" ]]; then
	  local USER_BASE_BRANCH_SEARCH="${USER_BASE_BRANCH//\*/}"
		local BASE_LOCAL_BRANCH=$(git branch --list | grep -w "$USER_BASE_BRANCH_SEARCH" | sed 's/^[* ]*//g' | sed -e 's/remotes\///' | sed -e 's/origin\///' | head -n 1)
		local BASE_REMOTE_BRANCH=$(git branch -r --list | grep -w "$USER_BASE_BRANCH_SEARCH" | sed 's/^[* ]*//g' | sed -e 's/remotes\///' | sed -e 's/origin\///' | head -n 1)

		if [[ -n "$BASE_LOCAL_BRANCH" ]]; then
			git branch $BRANCH $BASE_LOCAL_BRANCH
			git checkout $BRANCH --quiet

			if [ $? -eq 0 ]; then
				echo "created branch: \e[94m$BRANCH\e[0m based of: \e[94m$BASE_LOCAL_BRANCH\e[0m";
			fi
		elif [[ -n "$BASE_REMOTE_BRANCH" ]]; then
			git checkout $BASE_REMOTE_BRANCH --quiet
			git branch $BRANCH $BASE_REMOTE_BRANCH
			git checkout $BRANCH --quiet
			# git branch -D --quiet $BASE_REMOTE_BRANCH do not delete base branch because it helps vscode create a PR

			if [ $? -eq 0 ]; then
				echo "created branch: \e[94m$BRANCH\e[0m based of: \e[94m$BASE_REMOTE_BRANCH\e[0m";
			fi
		else
			echo "\e[31mfatal:\e[0m not a valid branch name: \e[94m$USER_BASE_BRANCH\e[0m"
		fi
	else
		if [[ -n "$2" ]]; then
			echo "\e[31mfatal:\e[0m could not find branch matching: \e[94m$2\e[0m"
		fi
	fi
}

# go to default branch stablished in config
dev() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	local PAST_BRANCH=$(git branch --show-current)

	local DEVELOP=$(git branch -a --list | grep -w develop | sed 's/^[* ]*//g')
	local DEV=$(git branch -a --list | grep -w dev | sed 's/^[* ]*//g')

	if [[ -n "$DEVELOP" ]]; then
		git checkout develop --quiet

		if [ $? -eq 0 ]; then
			if [[ "$PAST_BRANCH" != "develop" ]]; then
				echo "switched to branch: \e[94mdevelop\e[0m";
			fi
		fi

		return 0;
	fi

	if [[ -n "$DEV" ]]; then
		git checkout dev --quiet

		if [ $? -eq 0 ]; then
			if [[ "$PAST_BRANCH" != "dev" ]]; then
				echo "switched to branch: \e[94mdev\e[0m";
			fi
		fi

		return 0;
	fi

	echo "no branch was found: \e[94mdev\e[0m or \e[94mdevelop\e[0m";
}

main() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	local MY_BRANCH=$(git branch --show-current)
	local DEFAULT_MAIN_BRANCH=$(git config --get init.defaultBranch)
	local MAIN_BRANCH="${DEFAULT_MAIN_BRANCH:-main}"

	git checkout $MAIN_BRANCH --quiet

	if [ $? -eq 0 ]; then
		if [[ "$MY_BRANCH" != "$MAIN_BRANCH" ]]; then
			echo "switched to branch: \e[94m$MAIN_BRANCH\e[0m";
		fi

		return 0;
	fi

	echo "no branch was found: \e[94m$MAIN_BRANCH\e[0m";
}

# Merging & Rebasing ========================================================================
# rebase $1 or main
rebase() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	local MY_BRANCH=$(git branch --show-current)
	local DEFAULT_MAIN_BRANCH=$(git config --get init.defaultBranch)
	local MAIN_BRANCH="${1:-$DEFAULT_MAIN_BRANCH}"

	if [[ "$MY_BRANCH" == "$DEFAULT_MAIN_BRANCH" ]]; then
		echo "\e[31mfatal:\e[0m cannot rebase in branch: $MY_BRANCH";
		return 0;
	fi

	git fetch origin -q $MAIN_BRANCH:$MAIN_BRANCH

	echo "rebase from branch '\e[94m$MAIN_BRANCH\e[0m'"
	git rebase $MAIN_BRANCH

	if read -qs "?done! continue git push? (y/n) "; then
		echo "y"
    git push --force-with-lease --tags --no-verify --set-upstream origin $MY_BRANCH
  else
  	echo "n"
  fi
}

# merge $1 or main
merge() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	local MY_BRANCH=$(git branch --show-current)
	local DEFAULT_MAIN_BRANCH=$(git config --get init.defaultBranch)
	local MAIN_BRANCH="${1:-$DEFAULT_MAIN_BRANCH}"

	if [[ "$MY_BRANCH" == "$DEFAULT_MAIN_BRANCH" ]]; then
		echo "\e[31mfatal:\e[0m cannot merge in branch: $MY_BRANCH";
		return 0;
	fi

	git fetch origin -q $MAIN_BRANCH:$MAIN_BRANCH

	echo "merge from branch '\e[94m$MAIN_BRANCH\e[0m'"
	git merge $MAIN_BRANCH

	if read -qs "?done! continue git push? (y/n) "; then
		echo "y"
    git push --no-verify --set-upstream origin $MY_BRANCH
  else
  	echo "n"
  fi
}

# Delete local branches ===========================================================
prune() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	local DEFAULT_MAIN_BRANCH=$(git config --get init.defaultBranch)

	# local STATUS=$(git status --porcelain)
	# if [[ -z $STATUS ]]; then # clean status
	# 	git checkout $DEFAULT_MAIN_BRANCH --quiet
	# fi

	# delets all tags
	git tag -l | xargs git tag -d
	# fetch tags that exist in the remote
	git fetch --tags
	
	#Lists all branches that have been merged into the currently checked-out branch
	#that can be safely deleted without losing any unmerged work and filters out the default branch
	git branch --merged | grep -v "^\*\\|$DEFAULT_MAIN_BRANCH" | xargs -n 1 git branch -d
	git prune
}

# list branches and select one to delete or delete $1
delb() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	if [[ -n "$1" ]]; then
		delb1 $1
		return 0;
	fi

	if [ ! -d ".git" ]; then
		echo "\e[31mfatal:\e[0m not a project folder: $(pwd)"
		return 0;
	fi

	local MY_BRANCH=$(git branch --show-current)
	local STATUS=$(git status --porcelain)
	local DEFAULT_MAIN_BRANCH=$(git config --get init.defaultBranch)

  echo "list of local branches in "$'\e[94m'$(basename $(git remote get-url origin))$'\e[0m'":\n";
  PS3="select option: ";

  select CHOICE in $(git branch --format='%(refname:short)' | sed '') "quit"; do
  	case $CHOICE in
		  "quit")
	      break
	      ;;
		  *)
	      if [[ -n "$CHOICE" ]]; then
				  if read -qs "?delete local branch "$'\e[94m'$CHOICE$'\e[0m'" (y/n) "; then
				    echo "y"
					  delb1 $CHOICE
				  else
				  	echo "n"
				  fi
				  # break
	      fi
	      ;;
    esac
	done
}

delb1() {
	checkgit; if [ ! $? -eq 0 ]; then return 0; fi

	local MY_BRANCH=$(git branch --show-current)
	local STATUS=$(git status --porcelain)

	if [[ "$1" == "$MY_BRANCH" ]]; then
		if [[ -n "$STATUS" ]]; then
			echo "\e[33mwarn:\e[0m trying to delete current branch but there's work in progress, execute: \e[93mpush\e[0m, \e[93mpushf\e[0m, \e[93mclean\e[0m or \e[93mreseta\e[0m"
			return 0
		fi

		local DEFAULT_MAIN_BRANCH=$(git config --get init.defaultBranch)

		git checkout $DEFAULT_MAIN_BRANCH -q
		git branch -D $1

		return 0;
	fi

	git branch -D $1
}
