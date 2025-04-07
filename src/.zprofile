# Version 1.4.0

# General
alias cl="tput reset"
alias hg="history | grep" # $1
alias kill="npx kill-port" # $1
alias ll="ls -lAF"
alias nodei="node -e 'console.log(process.version, process.arch, process.platform)'"
alias nlist="npm list --global --depth=0"
alias path="echo $PATH"
alias refresh="source ~/.zshrc && source ~/.zprofile"
alias update="omz update && oh-my-posh upgrade"

local Z_CONFIG_FILE=~/.zprofile_config

# project 1
local Z_PROJECT_FOLDER_1=""
local Z_PROJECT_FOLDER_1_=$(sed -n 's/^Z_PROJECT_FOLDER_1=\([^ ]*\)/\1/p' "$Z_CONFIG_FILE")
if [[ -n "$Z_PROJECT_FOLDER_1_" ]]; then Z_PROJECT_FOLDER_1=$(realpath "$(echo "$Z_PROJECT_FOLDER_1_" | sed "s|^~|$HOME|")"); fi
local Z_PROJECT_SHORT_NAME_1=$(sed -n 's/^Z_PROJECT_SHORT_NAME_1=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PROJECT_REPO_1=$(sed -n 's/^Z_PROJECT_REPO_1=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PACKAGE_MANAGER_1=$(sed -n 's/^Z_PACKAGE_MANAGER_1=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_SETUP_1=$(sed -n 's/^Z_SETUP_1=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_RUN_1=$(sed -n 's/^Z_RUN_1=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_TEMPLATE_1=$(sed -n 's/^Z_PR_TEMPLATE_1=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_REPLACE_1=$(sed -n 's/^Z_PR_REPLACE_1=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_APPEND_1=$(sed -n 's/^Z_PR_APPEND_1=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_RUN_TEST_1=$(sed -n 's/^Z_PR_RUN_TEST_1=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
# project 2
local Z_PROJECT_FOLDER_2=""
local Z_PROJECT_FOLDER_2_=$(sed -n 's/^Z_PROJECT_FOLDER_2=\([^ ]*\)/\1/p' "$Z_CONFIG_FILE")
if [[ -n "$Z_PROJECT_FOLDER_2_" ]]; then Z_PROJECT_FOLDER_2=$(realpath "$(echo "$Z_PROJECT_FOLDER_2_" | sed "s|^~|$HOME|")"); fi
local Z_PROJECT_SHORT_NAME_2=$(sed -n 's/^Z_PROJECT_SHORT_NAME_2=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PROJECT_REPO_2=$(sed -n 's/^Z_PROJECT_REPO_2=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PACKAGE_MANAGER_2=$(sed -n 's/^Z_PACKAGE_MANAGER_2=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_SETUP_2=$(sed -n 's/^Z_SETUP_2=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_RUN_2=$(sed -n 's/^Z_RUN_2=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_TEMPLATE_2=$(sed -n 's/^Z_PR_TEMPLATE_2=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_REPLACE_2=$(sed -n 's/^Z_PR_REPLACE_2=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_APPEND_2=$(sed -n 's/^Z_PR_APPEND_2=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_RUN_TEST_2=$(sed -n 's/^Z_PR_RUN_TEST_2=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
# project 3
local Z_PROJECT_FOLDER_3=""
local Z_PROJECT_FOLDER_3_=$(sed -n 's/^Z_PROJECT_FOLDER_3=\([^ ]*\)/\1/p' "$Z_CONFIG_FILE")
if [[ -n "$Z_PROJECT_FOLDER_3_" ]]; then Z_PROJECT_FOLDER_3=$(realpath "$(echo "$Z_PROJECT_FOLDER_3_" | sed "s|^~|$HOME|")"); fi
local Z_PROJECT_SHORT_NAME_3=$(sed -n 's/^Z_PROJECT_SHORT_NAME_3=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PROJECT_REPO_3=$(sed -n 's/^Z_PROJECT_REPO_3=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PACKAGE_MANAGER_3=$(sed -n 's/^Z_PACKAGE_MANAGER_3=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_SETUP_3=$(sed -n 's/^Z_SETUP_3=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_RUN_3=$(sed -n 's/^Z_RUN_3=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_TEMPLATE_3=$(sed -n 's/^Z_PR_TEMPLATE_3=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_REPLACE_3=$(sed -n 's/^Z_PR_REPLACE_3=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_APPEND_3=$(sed -n 's/^Z_PR_APPEND_3=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)
local Z_PR_RUN_TEST_3=$(sed -n 's/^Z_PR_RUN_TEST_3=\([^ ]*\)/\1/p' $Z_CONFIG_FILE)

local Z_PROJECT_FOLDER=""
local Z_PROJECT_SHORT_NAME=""
local Z_PROJECT_REPO=""
local Z_PACKAGE_MANAGER=""
local Z_SETUP=""
local Z_RUN=""
local Z_PR_TEMPLATE=""
local Z_PR_REPLACE=""
local Z_PR_APPEND=""
local Z_PR_RUN_TEST=""

local ERROR_PROJ_1=0;

help() {
	#tput reset
	local TITLE_COR="\e[37m"
	local COMMAND_COR="\e[33m"
	local PROJECT_COR="\e[94m"
	local PROJECT_COR_2="\e[34m"
	local PACKAGE_COR="\e[35m"
	local GIT_COR="\e[36m"

	echo "$TITLE_COR -- general ------------------------------------------------- \e[0m"
	echo " $COMMAND_COR cl \e[0m\t\t = clear"
	echo " $COMMAND_COR del \$1\e[0m\t = delete path"
	echo " $COMMAND_COR hg \$1 \e[0m\t = history | grep"
	echo " $COMMAND_COR kill \$1 \e[0m\t = kill port"
	echo " $COMMAND_COR ll \e[0m\t\t = ls -laF"
	echo " $COMMAND_COR nodei \e[0m\t = info about node"
	echo " $COMMAND_COR nlist \e[0m\t = npm list global"
	echo " $COMMAND_COR path \e[0m\t\t = echo \$PATH"
	echo " $COMMAND_COR refresh \e[0m\t = source .zshrc + .zprofile"
	echo " $COMMAND_COR update \e[0m\t = update zsh + omp"

	if [ "$ERROR_PROJ_1" -eq 1 ]; then
		echo ""
		echo "must have at least project #1 configured!"
		echo "edit \e[33m~/.zprofile_config\e[0m and add values for:"
		echo ""
		echo "Z_PROJECT_FOLDER_1="
		echo "Z_PROJECT_SHORT_NAME_1="
		echo "Z_PROJECT_REPO_1="
		echo ""
		echo "then type: refresh"
		return 0;
	fi

	echo "$TITLE_COR -- project ------------------------------------------------- \e[0m"
	echo " $PROJECT_COR_2 pro \e[0m\t\t = set project based on CWD"
	echo " $PROJECT_COR_2 pro \$1 \e[0m\t = set project \$1"
	if [[ -n "$Z_PROJECT_FOLDER_1_" ]] then echo " $PROJECT_COR_2 $Z_PROJECT_SHORT_NAME_1 \e[0m$([ ${#Z_PROJECT_SHORT_NAME_1} -lt 5 ] && echo -e "\t\t = cd $Z_PROJECT_FOLDER_1_" || echo -e "\t = cd $Z_PROJECT_FOLDER_1_")"; fi
	if [[ -n "$Z_PROJECT_FOLDER_2_" ]] then echo " $PROJECT_COR_2 $Z_PROJECT_SHORT_NAME_2 \e[0m$([ ${#Z_PROJECT_SHORT_NAME_2} -lt 5 ] && echo -e "\t\t = cd $Z_PROJECT_FOLDER_2_" || echo -e "\t = cd $Z_PROJECT_FOLDER_2_")"; fi
	if [[ -n "$Z_PROJECT_FOLDER_3_" ]] then echo " $PROJECT_COR_2 $Z_PROJECT_SHORT_NAME_3 \e[0m$([ ${#Z_PROJECT_SHORT_NAME_3} -lt 5 ] && echo -e "\t\t = cd $Z_PROJECT_FOLDER_3_" || echo -e "\t = cd $Z_PROJECT_FOLDER_3_")"; fi

	if [[ -n "$Z_PROJECT_SHORT_NAME" ]] then
		echo "$TITLE_COR -- $Z_PROJECT_SHORT_NAME $(printf "%-${$((68 - ${#Z_PROJECT_SHORT_NAME} - 12))}s" "-" | tr ' ' '-') \e[0m"
		echo " $PROJECT_COR clone \e[0m\t = clone $Z_PROJECT_SHORT_NAME + switch to $(git config --get init.defaultBranch)"
		echo " $PROJECT_COR clone \$1\e[0m\t = clone $Z_PROJECT_SHORT_NAME + switch to branch \$1"
		echo " $PROJECT_COR revs \e[0m\t\t = list $Z_PROJECT_SHORT_NAME reviews"
		echo " $PROJECT_COR rev \$1\e[0m\t = review $Z_PROJECT_SHORT_NAME branch"
		echo " $PROJECT_COR rev+ \$1\e[0m\t = find and review $Z_PROJECT_SHORT_NAME branch"
		echo " $PROJECT_COR run \e[0m\t\t = Z_RUN current folder"
		echo " $PROJECT_COR run \$1 \e[0m\t = Z_RUN folder \$1"
		echo " $PROJECT_COR run \$1 \$2 \e[0m\t = pro \$1 Z_RUN folder \$2"
		echo " $PROJECT_COR setup \e[0m\t = Z_SETUP current folder"
		echo " $PROJECT_COR setup \$1 \e[0m\t = Z_SETUP folder \$1"
		echo " $PROJECT_COR setup \$1 \$2 \e[0m\t = pro \$1 Z_SETUP folder \$2"
		
		echo "$TITLE_COR -- $Z_PACKAGE_MANAGER $(printf "%-${$((68 - ${#Z_PACKAGE_MANAGER} - 12))}s" "-" | tr ' ' '-') \e[0m"
		echo " $PACKAGE_COR build \e[0m\t = $Z_PACKAGE_MANAGER build"
		echo " $PACKAGE_COR cov \e[0m\t\t = $Z_PACKAGE_MANAGER test:coverage"
		echo " $PACKAGE_COR e2e \e[0m\t\t = $Z_PACKAGE_MANAGER test:e2e"
		echo " $PACKAGE_COR e2e \$1 \e[0m\t = $Z_PACKAGE_MANAGER test:e2e project"
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
	fi

	echo "$TITLE_COR -- git ----------------------------------------------------- \e[0m"
	echo " $GIT_COR gconf \e[0m\t = git config"
	echo " $GIT_COR glog \e[0m\t\t = git log"
	echo " $GIT_COR renb \$1\e[0m\t = rename current branch"
	echo " $GIT_COR st \e[0m\t\t = git status"
	echo "$TITLE_COR -- git clean ----------------------------------------------- \e[0m"
	echo " $GIT_COR clean\e[0m\t\t = clean + restore"
	echo " $GIT_COR delb \e[0m\t\t = delete branches selectively"
	echo " $GIT_COR delb \$1\e[0m\t = delete branch locally"
	echo " $GIT_COR prune \e[0m\t = prune tags + branches"
	echo " $GIT_COR reset \e[0m\t = unstage all files"
	echo " $GIT_COR reset \$1\e[0m\t = unstage files \$1"
	echo " $GIT_COR reseta \e[0m\t = reset hard + clean + pull"
	echo " $GIT_COR reset1 \e[0m\t = reset soft 1 commit"
	echo " $GIT_COR reset2 \e[0m\t = reset soft 2 commits"
	echo " $GIT_COR reset3 \e[0m\t = reset soft 3 commits"
	echo " $GIT_COR reset4 \e[0m\t = reset soft 4 commits"
	echo " $GIT_COR reset5 \e[0m\t = reset soft 5 commits"
	echo "$TITLE_COR -- git list ------------------------------------------------ \e[0m"
	echo " $GIT_COR gll \e[0m\t\t = list local branches"
	echo " $GIT_COR gll \$1 \e[0m\t = list local branches matching \$1"
	echo " $GIT_COR glr \e[0m\t\t = list remote branches"
	echo " $GIT_COR glr \$1 \e[0m\t = list remote branches matching \$1"
	echo "$TITLE_COR -- git pull ------------------------------------------------ \e[0m"
	echo " $GIT_COR fetch \e[0m\t = fetch all"
	echo " $GIT_COR fetch \$1 \e[0m\t = fetch branch"
	echo " $GIT_COR pull \e[0m\t\t = pull all"
	echo " $GIT_COR pullr \e[0m\t = pull rebase"
	echo "$TITLE_COR -- git push ------------------------------------------------ \e[0m"
	echo " $GIT_COR add \$1\e[0m\t = add files to index"
	echo " $GIT_COR commit \$1\e[0m\t = commit message"
	echo " $GIT_COR commita \$1\e[0m\t = add + commit message"
	echo " $GIT_COR pr \e[0m\t\t = create pull request"
	echo " $GIT_COR pr \$1\e[0m\t\t = create pr w/ labels \$1"
	echo " $GIT_COR push \e[0m\t\t = push all no-verify"
	echo " $GIT_COR pushf \e[0m\t = push all force"
	echo "$TITLE_COR -- git rebase ---------------------------------------------- \e[0m"
	echo " $GIT_COR abort\e[0m\t\t = abort rebase/merge/cherry-pick"
	echo " $GIT_COR chc \e[0m\t\t = continue cherry-pick"
	echo " $GIT_COR chp \$1 \e[0m\t = cherry-pick commit \$1"
	echo " $GIT_COR mc \e[0m\t\t = continue merge"
	echo " $GIT_COR merge \e[0m\t = merge from $(git config --get init.defaultBranch) branch"
	echo " $GIT_COR merge \$1 \e[0m\t = merge from branch \$1"
	echo " $GIT_COR rc \e[0m\t\t = continue rebase"
	echo " $GIT_COR rebase \e[0m\t = rebase from $(git config --get init.defaultBranch) branch"
	echo " $GIT_COR rebase \$1 \e[0m\t = rebase from branch \$1"
	echo "$TITLE_COR -- git stash ----------------------------------------------- \e[0m"
	echo " $GIT_COR stash \e[0m\t = unnamed stash of all files"
	echo " $GIT_COR stash \$1 \e[0m\t = named stash of all files"
	echo " $GIT_COR stashes \e[0m\t = list all stashes"
	echo "$TITLE_COR -- git switch ---------------------------------------------- \e[0m"
	echo " $GIT_COR ck \$1 \e[0m\t = switch to branch \$1"
	echo " $GIT_COR ck+ \$1 \e[0m\t = find branch + switch"
	echo " $GIT_COR ck \$1 \$2 \e[0m\t = branch off of \$2 + switch"
	echo " $GIT_COR ck+ \$1 \$2 \e[0m\t = find, branch off of \$2 + switch"
	echo " $GIT_COR dev \e[0m\t\t = switch to develop or dev"
	echo " $GIT_COR main \e[0m\t\t = switch to master or main"
	echo " $GIT_COR stage \e[0m\t = switch to staging or stage"
	echo " $GIT_COR default \e[0m\t = switch to $(git config --get init.defaultBranch)"
	echo "$TITLE_COR -- git tags ------------------------------------------------ \e[0m"
	echo " $GIT_COR dtag \$1\e[0m\t = delete tag remotely"
	echo " $GIT_COR ltag \e[0m\t\t = display latest tag"
	echo " $GIT_COR tag \$1\e[0m\t = create tag remotely"
	echo " $GIT_COR tags \e[0m\t\t = list all tags"
}

check_project_1() {
	if [[ -n "$Z_PROJECT_FOLDER_1_" ]]; then Z_PROJECT_FOLDER_1=$(realpath "$(echo "$Z_PROJECT_FOLDER_1_" | sed "s|^~|$HOME|")"); fi

	if [ -z $Z_PROJECT_FOLDER_1 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PROJECT_FOLDER_1=$Z_PROJECT_FOLDER_1_"
		ERROR_PROJ_1=1
	else
		if [ ! -d "$Z_PROJECT_FOLDER_1" ]; then
			echo "\e[31mfatal:\e[0m cannot locate Z_PROJECT_FOLDER_1=$Z_PROJECT_FOLDER_1_"
			ERROR_PROJ_1=1
		fi
	fi
	if [ -z $Z_PROJECT_SHORT_NAME_1 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PROJECT_SHORT_NAME_1="
		ERROR_PROJ_1=1
	fi
	if [ -z $Z_PROJECT_REPO_1 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PROJECT_REPO_1="
		ERROR_PROJ_1=1
	fi
	if [ -z $Z_PACKAGE_MANAGER_1 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PACKAGE_MANAGER_1="
		ERROR_PROJ_1=1
	fi

	if [ "$ERROR_PROJ_1" -eq 1 ]; then
		echo "type: help";
		echo "";
		return 1;
	fi

	return 0;
}

check_project_2() {
	local ERROR_PROJ_2=0

	if [[ -n "$Z_PROJECT_FOLDER_2_" ]]; then Z_PROJECT_FOLDER_2=$(realpath "$(echo "$Z_PROJECT_FOLDER_2_" | sed "s|^~|$HOME|")"); fi

	if [ -z $Z_PROJECT_FOLDER_2 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PROJECT_FOLDER_2=$Z_PROJECT_FOLDER_2_"
		ERROR_PROJ_2=1
	else
		if [ ! -d "$Z_PROJECT_FOLDER_2" ]; then
			echo "\e[31mfatal:\e[0m cannot locate Z_PROJECT_FOLDER_2=$Z_PROJECT_FOLDER_2_"
			ERROR_PROJ_2=1
		fi
	fi
	if [ -z $Z_PROJECT_SHORT_NAME_2 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PROJECT_SHORT_NAME_2="
		ERROR_PROJ_2=1
	fi
	if [ -z $Z_PROJECT_REPO_2 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PROJECT_REPO_2="
		ERROR_PROJ_2=1
	fi
	if [ -z $Z_PACKAGE_MANAGER_2 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PACKAGE_MANAGER_2="
		ERROR_PROJ_2=1
	fi

	if [ "$ERROR_PROJ_2" -eq 1 ]; then
		echo "edit ~/.zprofile_config then type: refresh";
		echo "";
		return 1;
	fi

	return 0;
}

check_project_3() {
	local ERROR_PROJ_3=0

	if [[ -n "$Z_PROJECT_FOLDER_3_" ]]; then Z_PROJECT_FOLDER_3=$(realpath "$(echo "$Z_PROJECT_FOLDER_3_" | sed "s|^~|$HOME|")"); fi

	if [ -z $Z_PROJECT_FOLDER_3 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PROJECT_FOLDER_3=$Z_PROJECT_FOLDER_3_"
		ERROR_PROJ_3=1
	else	
		if [ ! -d "$Z_PROJECT_FOLDER_3" ]; then
			echo "\e[31mfatal:\e[0m cannot locate Z_PROJECT_FOLDER_3=$Z_PROJECT_FOLDER_3_"
			ERROR_PROJ_3=1
		fi
	fi
	if [ -z $Z_PROJECT_SHORT_NAME_3 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PROJECT_SHORT_NAME_3="
		ERROR_PROJ_3=1
	fi
	if [ -z $Z_PROJECT_REPO_3 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PROJECT_REPO_3="
		ERROR_PROJ_3=1
	fi
	if [ -z $Z_PACKAGE_MANAGER_3 ]; then
		echo "\e[31mfatal:\e[0m not found Z_PACKAGE_MANAGER_3="
		ERROR_PROJ_3=1
	fi

	if [ "$ERROR_PROJ_3" -eq 1 ]; then
		echo "edit ~/.zprofile_config then type: refresh";
		echo "";
		return 1;
	fi

	return 0;
}

check_project_1
if [ ! $? -eq 0 ]; then return 1; fi

[ ! -f ~/.zprofile_user_config ] && echo "$Z_PROJECT_SHORT_NAME_1" > ~/.zprofile_user_config

pro_pwd() {
	if [ -z "$1" ] || [[ "$1" == "pwd" ]]; then
		local PWD=$(PWD);
		local PWD_NOT_1=0;
		local PWD_NOT_2=0;
		local PWD_NOT_3=0;
		if [[ -n "$Z_PROJECT_SHORT_NAME_1" ]] && [[ -n "$Z_PROJECT_FOLDER_1" ]]; then
			if [[ "$PWD" == "$Z_PROJECT_FOLDER_1" ]]; then
				pro $Z_PROJECT_SHORT_NAME_1
				return 0;
			else
				PWD_NOT_1=1;
			fi
		else
			check_project_1; if [ ! $? -eq 0 ]; then return 1; fi
		fi
		if [[ -n "$Z_PROJECT_SHORT_NAME_2" ]] && [[ -n "$Z_PROJECT_FOLDER_2" ]]; then
			if [[ "$PWD" == "$Z_PROJECT_FOLDER_2" ]]; then
				pro $Z_PROJECT_SHORT_NAME_2
				return 0;
			else
				PWD_NOT_2=1;
			fi
		fi
		if [[ -n "$Z_PROJECT_SHORT_NAME_3" ]] && [[ -n "$Z_PROJECT_FOLDER_3" ]]; then
			if [[ "$PWD" == "$Z_PROJECT_FOLDER_3" ]]; then
				pro $Z_PROJECT_SHORT_NAME_3
				return 0;
			else
				PWD_NOT_3=1;
			fi
		fi

		if [ -z "$2" ]; then
			if [[ -n "$Z_PROJECT_SHORT_NAME" ]]; then
				echo "Project is: \e[34m$Z_PROJECT_SHORT_NAME\e[0m"
				echo ""
			fi
			if [[ "$PWD_NOT_1" == 1 ]]; then echo "type: \e[93mpro $Z_PROJECT_SHORT_NAME_1\e[0m"; fi
			if [[ "$PWD_NOT_2" == 1 ]]; then echo "type: \e[93mpro $Z_PROJECT_SHORT_NAME_2\e[0m"; fi
			if [[ "$PWD_NOT_3" == 1 ]]; then echo "type: \e[93mpro $Z_PROJECT_SHORT_NAME_3\e[0m"; fi
		fi

		return 1;
	fi

	if [[ ! "$1" == "$Z_PROJECT_SHORT_NAME_1" ]] && [[ ! "$1" == "$Z_PROJECT_SHORT_NAME_2" ]] && [[ ! "$1" == "$Z_PROJECT_SHORT_NAME_3" ]]; then		
		which_pro;
		return 1;
	fi

	return 2;
}

which_pro() {
	if [[ -n "$Z_PROJECT_SHORT_NAME" ]]; then
		echo "Project is: \e[34m$Z_PROJECT_SHORT_NAME\e[0m"
		echo ""
	fi

	if [[ -n "$Z_PROJECT_SHORT_NAME_1" ]]; then
		if [[ ! "$Z_PROJECT_SHORT_NAME" == "$Z_PROJECT_SHORT_NAME_1" ]]; then
			echo "type: \e[93mpro $Z_PROJECT_SHORT_NAME_1\e[0m";
		fi
	else
		check_project_1; if [ ! $? -eq 0 ]; then return 1; fi
	fi

	if [[ -n "$Z_PROJECT_SHORT_NAME_2" ]] && [[ ! "$Z_PROJECT_SHORT_NAME" == "$Z_PROJECT_SHORT_NAME_2" ]]; then
		echo "type: \e[93mpro $Z_PROJECT_SHORT_NAME_2\e[0m";
	fi

	if [[ -n "$Z_PROJECT_SHORT_NAME_3" ]] && [[ ! "$Z_PROJECT_SHORT_NAME" == "$Z_PROJECT_SHORT_NAME_3" ]]; then
		echo "type: \e[93mpro $Z_PROJECT_SHORT_NAME_3\e[0m";
	fi
}

pro() {
	pro_pwd $1
	if [ ! $? -eq 2 ]; then return 1; fi

	if [[ "$1" == "$Z_PROJECT_SHORT_NAME_1" ]]; then
		check_project_1;
		if [ ! $? -eq 0 ]; then
			which_pro;
			return 1;
		fi

		Z_PROJECT_FOLDER="$Z_PROJECT_FOLDER_1"
		export Z_PROJECT_SHORT_NAME="$Z_PROJECT_SHORT_NAME_1"
		Z_PROJECT_REPO="$Z_PROJECT_REPO_1"
		Z_PACKAGE_MANAGER="$Z_PACKAGE_MANAGER_1"
		Z_SETUP="$Z_SETUP_1"
		Z_RUN="$Z_RUN_1"
		Z_PR_TEMPLATE="$Z_PR_TEMPLATE_1"
		Z_PR_REPLACE="$Z_PR_REPLACE_1"
		Z_PR_APPEND="$Z_PR_APPEND_1"
		Z_PR_RUN_TEST="$Z_PR_RUN_TEST_1"

	elif [[ "$1" == "$Z_PROJECT_SHORT_NAME_2" ]]; then
		check_project_2;
		if [ ! $? -eq 0 ]; then
			which_pro;
			return 1;
		fi

		Z_PROJECT_FOLDER="$Z_PROJECT_FOLDER_2"
		export Z_PROJECT_SHORT_NAME="$Z_PROJECT_SHORT_NAME_2"
		Z_PROJECT_REPO="$Z_PROJECT_REPO_2"
		Z_PACKAGE_MANAGER="$Z_PACKAGE_MANAGER_2"
		Z_SETUP="$Z_SETUP_2"
		Z_RUN="$Z_RUN_2"
		Z_PR_TEMPLATE="$Z_PR_TEMPLATE_2"
		Z_PR_REPLACE="$Z_PR_REPLACE_2"
		Z_PR_APPEND="$Z_PR_APPEND_2"
		Z_PR_RUN_TEST="$Z_PR_RUN_TEST_2"

	elif [[ "$1" == "$Z_PROJECT_SHORT_NAME_3" ]]; then
		check_project_3;
		if [ ! $? -eq 0 ]; then
			which_pro;
			return 1;
		fi

		Z_PROJECT_FOLDER="$Z_PROJECT_FOLDER_3"
		export Z_PROJECT_SHORT_NAME="$Z_PROJECT_SHORT_NAME_3"
		Z_PROJECT_REPO="$Z_PROJECT_REPO_3"
		Z_PACKAGE_MANAGER="$Z_PACKAGE_MANAGER_3"
		Z_SETUP="$Z_SETUP_3"
		Z_RUN="$Z_RUN_3"
		Z_PR_TEMPLATE="$Z_PR_TEMPLATE_3"
		Z_PR_REPLACE="$Z_PR_REPLACE_3"
		Z_PR_APPEND="$Z_PR_APPEND_3"
		Z_PR_RUN_TEST="$Z_PR_RUN_TEST_3"
	else
		which_pro;
		return 1;
	fi

	echo "$Z_PROJECT_SHORT_NAME" > ~/.zprofile_user_config
	which_pro;

	cd $Z_PROJECT_FOLDER
	return 0;
}

pro_pwd pwd 2
if [ ! $? -eq 0 ]; then
	local Z_PROJECT_USER_CONFIG="$(head -n 1 ~/.zprofile_user_config)";
	if [[ "$Z_PROJECT_USER_CONFIG" == "$Z_PROJECT_SHORT_NAME_1" ]] || [[ "$Z_PROJECT_USER_CONFIG" == "$Z_PROJECT_SHORT_NAME_2" ]] || [[ "$Z_PROJECT_USER_CONFIG" == "$Z_PROJECT_SHORT_NAME_3" ]]; then
		pro "$Z_PROJECT_USER_CONFIG"
	fi
fi

check_pro() {
	if [ -z $Z_PROJECT_SHORT_NAME ] || [ -z $Z_PROJECT_FOLDER ]; then
		which_pro
	fi
}

check_pkg() {
	if [[ ! -f "package.json" ]]; then
		echo "\e[31mfatal:\e[0m not a project folder: package.json"
  	return 1;
	fi

	return 0;
}

check_git() {
	local FOLDER="${1:-$(PWD)}"

	if [[ "$Z_PROJECT_FOLDER" == "$FOLDER" ]] || [[ ${#FOLDER} -lt ${#Z_PROJECT_FOLDER} ]]; then
		echo "\e[31mfatal:\e[0m not a git repository: .git"
		return 1;
	fi
	
	if [ ! -d "$FOLDER/.git" ]; then
		check_git "$FOLDER/.."
	fi

	return 0;
}

# Deleting a path ===============================================================
del() {
	if [ -z $1 ]; then
		echo "\e[93mdel <path> to delete a folder or file\e[0m"
		return 0;
	fi

	local PATH_1=$(realpath $1)
	if [ ! $? -eq 0 ]; then return 1; fi

	if [ ! -e $PATH_1 ]; then
		echo "\e[31mfatal:\e[0m  no such file or directory"
		return 1;
	fi

	local FOLDER_PATH=$(realpath "$1")
	if [ ! $? -eq 0 ]; then return 1; fi

	local PARENT_FOLDER=$(dirname "$1")
	if [ ! $? -eq 0 ]; then return 1; fi

	local PARENT_PATH=$(realpath "$PARENT_FOLDER")
	if [ ! $? -eq 0 ]; then return 1; fi

	local CURRENT_PATH=$(realpath "$PWD")
	if [ ! $? -eq 0 ]; then return 1; fi

	local FLAG=0;
	local CONFIRM_MSG="";
	if [[ "$FOLDER_PATH" == "$CURRENT_PATH" ]]; then
		CONFIRM_MSG=""$'\e[31m'alert:$'\e[0m'" delete current path (y/n) ";
	else
		CONFIRM_MSG=""$'\e[33m'confirm:$'\e[0m'" delete "$'\e[94m'$FOLDER_PATH$'\e[0m'" (y/n) ";
	fi

	if read -qs "?$CONFIRM_MSG"; then
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
alias e2eui="$Z_PACKAGE_MANAGER test:e2e-ui"
alias fix="$Z_PACKAGE_MANAGER format && $Z_PACKAGE_MANAGER lint && $Z_PACKAGE_MANAGER format"
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

if [ -n "$Z_PROJECT_SHORT_NAME_1" ]; then alias $Z_PROJECT_SHORT_NAME_1="cd $Z_PROJECT_FOLDER_1 && pro $Z_PROJECT_SHORT_NAME_1"; fi
if [ -n "$Z_PROJECT_SHORT_NAME_2" ]; then alias $Z_PROJECT_SHORT_NAME_2="cd $Z_PROJECT_FOLDER_2 && pro $Z_PROJECT_SHORT_NAME_2"; fi
if [ -n "$Z_PROJECT_SHORT_NAME_3" ]; then alias $Z_PROJECT_SHORT_NAME_3="cd $Z_PROJECT_FOLDER_3 && pro $Z_PROJECT_SHORT_NAME_3"; fi

cov() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	mkdir -p coverage
	$Z_PACKAGE_MANAGER test:coverage --colors &> coverage/report.ans
	open ./coverage/report.ans -a "Visual Studio Code"
}

e2e() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	if [ -z $1 ]; then
		eval $Z_PACKAGE_MANAGER test:e2e
	else
		eval $Z_PACKAGE_MANAGER test:e2e --project $1
	fi
}

# Creating PRs =============================================================
pr() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

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
		git log --pretty=format:'%H | %ae | %s' $CURRENT_BRANCH | xargs -0 | while IFS= read -r line; do
		    # Extract commit hash, commit author, and commit message using the '|' separator
	    local commit_hash=$(echo "$line" | cut -d'|' -f1 | xargs)
	    local commit_author=$(echo "$line" | cut -d'|' -f2 | xargs)
	    local commit_message=$(echo "$line" | cut -d'|' -f3- | xargs -0)

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
		git log --branches --not --remotes --oneline --pretty=format:'%H | %s' | xargs -0 | while IFS= read -r line; do
	    local commit_hash=$(echo "$line" | cut -d'|' -f1 | xargs)
	    local commit_message=$(echo "$line" | cut -d'|' -f2- | xargs -0)

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

	if [ -f "$Z_PR_TEMPLATE" ]; then
		local PR_TEMPLATE=$(cat $Z_PR_TEMPLATE)

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
		local STATUS=$(git status --porcelain)

		if [[ -n "$STATUS" ]]; then
			st
			echo .
			if read -qs "?skip test? (y/n) "; then
		    echo "y"
		  else
		  	echo "n"
				return 0;
		  fi
		else
			test
			if [ ! $? -eq 0 ]; then
				echo "\e[33m\nfatal: tests are not passing! cannot push!\e[0m"
				return 1;
			fi
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
		check_pkg; if [ ! $? -eq 0 ]; then return 1; fi

		if [ -z $Z_RUN ]; then
			echo "\e[31mfatal:\e[0m not found Z_RUN="
			echo ""
			echo "edit ~/.zprofile_config then type: refresh"
			return 0;
		fi

		eval $Z_RUN
	else
		if [ -n "$2" ]; then
			if [[ "$1" == "$Z_PROJECT_SHORT_NAME_1" ]]; then
				check_project_1;
				if [ ! $? -eq 0 ]; then return 1; fi

				pro "$1"
				cd "$2"
				run
				return 0;

			elif [[ "$1" == "$Z_PROJECT_SHORT_NAME_2" ]]; then
				check_project_2;
				if [ ! $? -eq 0 ]; then return 1; fi

				pro "$1"
				cd "$2"
				run
				return 0;

			elif [[ "$1" == "$Z_PROJECT_SHORT_NAME_3" ]]; then
				check_project_3;
				if [ ! $? -eq 0 ]; then return 1; fi

				pro "$1"
				cd "$2"
				run
				return 0;
			fi
		else
			cd "$Z_PROJECT_FOLDER/$1"
			if [ ! $? -eq 0 ]; then return 1; fi
			run
			return 0;
		fi

		echo "type: \e[93mrun $Z_PROJECT_SHORT_NAME_1 <branch>\e[0m"
		echo "type: \e[93mrun $Z_PROJECT_SHORT_NAME_2 <branch>\e[0m"
		echo "type: \e[93mrun $Z_PROJECT_SHORT_NAME_3 <branch>\e[0m"
		return 1;
	fi
}

setup() {
	if [ -z "$1" ]; then
		check_pkg; if [ ! $? -eq 0 ]; then return 1; fi

		if [ -z $Z_SETUP ]; then
			echo "\e[31mfatal:\e[0m not found Z_SETUP="
			echo ""
			echo "edit ~/.zprofile_config then type: refresh"
			return 0;
		fi

		eval $Z_SETUP
	else
		if [ -n "$2" ]; then
			if [[ "$1" == "$Z_PROJECT_SHORT_NAME_1" ]]; then
				check_project_1;
				if [ ! $? -eq 0 ]; then return 1; fi

				pro "$1"
				cd "$2"
				setup
				return 0;

			elif [[ "$1" == "$Z_PROJECT_SHORT_NAME_2" ]]; then
				check_project_2;
				if [ ! $? -eq 0 ]; then return 1; fi

				pro "$1"
				cd "$2"
				setup
				return 0;

			elif [[ "$1" == "$Z_PROJECT_SHORT_NAME_3" ]]; then
				check_project_3;
				if [ ! $? -eq 0 ]; then return 1; fi

				pro "$1"
				cd "$2"
				setup
				return 0;
			fi
		else
			cd "$Z_PROJECT_FOLDER/$1"
			if [ ! $? -eq 0 ]; then return 1; fi
			setup
			return 0;
		fi

		echo "type: \e[93msetup $Z_PROJECT_SHORT_NAME_1 <branch>\e[0m"
		echo "type: \e[93msetup $Z_PROJECT_SHORT_NAME_2 <branch>\e[0m"
		echo "type: \e[93msetup $Z_PROJECT_SHORT_NAME_3 <branch>\e[0m"
		return 1;
	fi
}

# Clone =====================================================================
# review branch
revs() {
	if [ ! -d "$Z_PROJECT_FOLDER/revs" ]; then
		echo "no rev was found"
		echo "create review from exact branch: \e[93mrev <branch>\e[0m"
		echo "find matching branch and create review: \e[93mrev+ <branch>\e[0m"
		return 0;
	fi

	cd "$Z_PROJECT_FOLDER/revs"
	
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
}

rev+() {
	if [ -z $1 ]; then
		echo "find matching branch and create review: \e[93mrev+ <branch>\e[0m"
		echo "create review from exact branch: \e[93mrev <branch>\e[0m"
		echo "list reviews to open: \e[93mrevs\e[0m"
	else
		rev $1\*
	fi
}

rev() {
	if [ -z $1 ]; then
		echo "create review from exact branch: \e[93mrev <branch>\e[0m"
		echo "find matching branch and create review: \e[93mrev+ <branch>\e[0m"
		echo "list reviews to open: \e[93mrevs\e[0m"
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
	else
		# check if branch exists
		local REMOTE_BRANCH=$(git ls-remote --heads origin $BRANCH)
		local LOCAL_BRANCH=$(git branch --list $BRANCH | head -n 1)

		if [[ -n "$REMOTE_BRANCH" ]]; then
			BRANCH="$REMOTE_BRANCH"
		elif [[ -n "$LOCAL_BRANCH" ]]; then
			BRANCH="$LOCAL_BRANCH"
		else
			BRANCH=""
		fi
	fi

	if [[ ! -n "$BRANCH" ]]; then
		echo "\e[31mfatal:\e[0m did not match any branch known to git: $1"
		return 1;
	fi

	return 0;

	mkdir -p "$Z_PROJECT_FOLDER/revs"
	cd "$Z_PROJECT_FOLDER/revs"

	local BRANCH_PATH=""

	if [ ! -d "$Z_PROJECT_FOLDER/revs/rev.$BRANCH" ]; then
  	BRANCH_PATH="$Z_PROJECT_FOLDER/revs/rev.$BRANCH"
  else
		for i in {2..20}; do
			if [ ! -d "$Z_PROJECT_FOLDER/revs/rev$i.$BRANCH" ]; then
				BRANCH_PATH="$Z_PROJECT_FOLDER/revs/rev$i.$BRANCH"
				break;
			fi
		done
	fi

	cd "$BRANCH_PATH"
	git clone $Z_PROJECT_REPO $BRANCH
	cd $BRANCH
	git checkout -b $BRANCH
	setup
  code .
}

# clone my project and checkout
clone() {
	local BRANCH="$1"

	cd "$Z_PROJECT_FOLDER"

	if [ -z $1 ]; then
		echo "..."
	  git clone $Z_PROJECT_REPO "$Z_PROJECT_FOLDER/.temp" --quiet
	  cd ".temp"
		BRANCH=$(git config --get init.defaultBranch)
		cd ..
		rm -rf ".temp"
	fi

  git clone $Z_PROJECT_REPO "$Z_PROJECT_FOLDER/$BRANCH"
	if [ ! $? -eq 0 ]; then return 1; fi

	if [[ ! "$BRANCH" == "$(git config --get init.defaultBranch)" ]] && [ -z $2 ]; then
		#cd $BRANCH
		git checkout -b $BRANCH
	fi

	if [ ! -z $2 ]; then
		#cd $BRANCH
		git checkout -b $2
	fi
}

# simple clone any project to path
# clone() {
# 	if [ -z $1 ]; then
# 		echo "clone git repository into path: \e[93mclone <uri> [<path>]\e[0m"
# 		return 0;
# 	fi

# 	cd "$Z_PROJECT_FOLDER/.."

# 	# Extract the project name (repository name) from the Git URL
# 	local PROJECT_NAME=$(basename "$1" .git)

# 	# If the URL is using SSH (git@github.com:...) remove the "git@" and ":"
# 	if [[ "$1" == git@* ]]; then
# 		PROJECT_NAME=$(echo "$PROJECT_NAME" | sed 's/^.*://')
# 	fi

# 	if [ -z $2 ]; then
#   	git clone $1 "$PROJECT_NAME"
# 		if [ ! $? -eq 0 ]; then return 1; fi

#   	cd "$PROJECT_NAME"
#   	echo "opened $(pwd)"
#   else
#   	git clone $1 "$2"
# 		if [ ! $? -eq 0 ]; then return 1; fi

#   	cd "$2"
#   	echo "opened $(pwd)"
# 	fi
# }

# Git -----------------------------------------------------------------------==
alias add="git add" # $1
alias chc="git cherry-pick --continue"
alias chp="git cherry-pick" # $1
alias clean="git clean -fd -q && git restore -q ."
alias pull="git pull --all && git pull --tags --all"
alias pullr="git pull --rebase"
alias pushf="git push --no-verify --tags --force"
alias renb="git branch -m" # $1
alias glog="clear && git log -15 --graph --abbrev-commit --pretty=format:'%C(magenta)%h%Creset ~%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias mc="git add . && git merge --continue"
alias rc="git add . && git rebase --continue"
alias reset1="git log -1 --pretty=format:'%s' | xargs -0 && git reset --soft HEAD~1"
alias reset2="git log -2 --pretty=format:'%s' | xargs -0 && git reset --soft HEAD~2"
alias reset3="git log -3 --pretty=format:'%s' | xargs -0 && git reset --soft HEAD~3"
alias reset4="git log -4 --pretty=format:'%s' | xargs -0 && git reset --soft HEAD~4"
alias reset5="git log -5 --pretty=format:'%s' | xargs -0 && git reset --soft HEAD~5"
alias st="git status"
alias stashes="git stash list"

fetch() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	if [[ -z "$1" ]]; then
		git fetch --all
		git fetch --tags --all
	else
		local MY_BRANCH=$(git branch --show-current)

		if [[ "$MY_BRANCH" == "$1" ]]; then
			git fetch origin
		else
			git fetch origin $1:$1
		fi
	fi
}

gconf() {
	echo "\e[33mUsername:\e[0m $(git config --get user.name)"
	echo "\e[33mEmail:\e[0m $(git config --get user.email)"
	echo "\e[33mDefault branch:\e[0m $(git config --get init.defaultBranch)"
}

abort() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	GIT_EDITOR=true git rebase --abort
	GIT_EDITOR=true git merge --abort
	GIT_EDITOR=true git cherry-pick --abort
}

# Commits -----------------------------------------------------------------------
commita() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	if [ -z $1 ]; then
		echo "stage and commit all files with message: \e[93mcommit <message>\e[0m"
		return 0;
	fi

	git add --all
	git commit --no-verify --message "$1"
}

commit() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	if [ -z $1 ]; then
		echo "commit staged files with message: \e[93mcommit <message>\e[0m"
		return 0;
	fi

	git commit --no-verify --message "$1"
}

push() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	local MY_BRANCH=$(git branch --show-current)

	git push --no-verify --tags --set-upstream origin $MY_BRANCH
}

stash() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	git stash push --include-untracked --message "${1:-.}"
}

dtag() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	if [[ -z $1 ]]; then
		echo "delete tag: \e[93mdtag <name>\e[0m"
		return 0;
	fi
	git tag -d $1
	git push origin --delete $1
}

tag() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	if [[ -z $1 ]]; then
		echo "create a new tag: \e[93mtag <name>\e[0m"
		echo "display last tag: \e[93mltag\e[0m"
		echo "display all tags: \e[93mtags\e[0m"
		return 0;
	fi

	git tag --annotate $1 --message $1
	git push --no-verify --tags
}

ltag() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	tags 1
}

tags() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

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
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

  git restore --staged "${1:-.}"
}

reseta() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	local MY_BRANCH=$(git branch --show-current)

	git reset --hard origin/$MY_BRANCH
	git restore -q .
	git clean -fd -q
	git pull -q
}

# List branches -----------------------------------------------------------------------
# list remote branches that contains an optional text and adds a link to the branch in github
glr() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	git branch -r --list "*$1*" --sort=authordate --format='%(authordate:format:%m-%d-%Y) %(align:17,left)%(authorname)%(end) %(refname:strip=3)' | sed \
    -e 's/\([0-9]*-[0-9]*-[0-9]*\)/\x1b[32m\1\x1b[0m/' \
    -e 's/\([^\ ]*\)$/\x1b[34m\x1b]8;;https:\/\/github.com\/wmgtech\/wmg2-one-app\/tree\/\1\x1b\\\1\x1b]8;;\x1b\\\x1b[0m/'
}

# list only local branches that contains an optional text
gll() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	git branch --list "*$1*" --sort=authordate --format="%(authordate:format:%m-%d-%Y) %(align:17,left)%(authorname)%(end) %(refname:strip=2)" | sed \
		-e 's/\([0-9]*-[0-9]*-[0-9]*\)/\x1b[32m\1\x1b[0m/' \
	  -e 's/\([^ ]*\)$/\x1b[34m\1\x1b[0m/'
}


# Switch branches -----------------------------------------------------------------------
# check out a branch or create a new one if $2 is given
ck+() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

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
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	if [ -z $1 ]; then
		echo "checkout exact branch: \e[93mck <branch>\e[0m"
	  echo "create exact branch off of exact base branch: \e[93mck <branch>\e[0m \e[33m<base_branch>\e[0m"
	  echo "find matching branch and checkout: \e[93mck+ <branch>\e[0m"
	  echo "create exact branch off of matching base branch: \e[93mck+ <branch>\e[0m \e[33m<base_branch>\e[0m"
		return 0;
	fi

	local STATUS=$(git status --porcelain)
	if [[ -n "$STATUS" ]]; then # clean status
		st
		echo .
		echo "execute: \e[93mpush\e[0m, \e[93mpushf\e[0m, \e[93mclean\e[0m or \e[93mreseta\e[0m"
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
			return 1;
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
			return 1;
		fi
	else
		if [[ -n "$2" ]]; then
			echo "\e[31mfatal:\e[0m could not find branch matching: \e[94m$2\e[0m"
			return 1;
		fi
	fi
}

# checkout dev or develop branch
dev() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	local PAST_BRANCH=$(git branch --show-current)

	if [[ -n "$(git branch -a --list | grep -w develop | sed 's/^[* ]*//g')" ]]; then
		git checkout develop --quiet

		if [ $? -eq 0 ]; then
			if [[ "$PAST_BRANCH" != "develop" ]]; then
				echo "switched to branch: \e[94mdevelop\e[0m";
			fi
		fi

		return 0;
	fi

	if [[ -n "$(git branch -a --list | grep -w dev | sed 's/^[* ]*//g')" ]]; then
		git checkout dev --quiet

		if [ $? -eq 0 ]; then
			if [[ "$PAST_BRANCH" != "dev" ]]; then
				echo "switched to branch: \e[94mdev\e[0m";
			fi
		fi

		return 0;
	fi

	echo "no branch was found: dev or develop";
}

# checkout main branch
main() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	local PAST_BRANCH=$(git branch --show-current)

	if [[ -n "$(git branch -a --list | grep -w master | sed 's/^[* ]*//g')" ]]; then
		git checkout master --quiet

		if [ $? -eq 0 ]; then
			if [[ "$PAST_BRANCH" != "master" ]]; then
				echo "switched to branch: \e[94mmaster\e[0m";
			fi
		fi

		return 0;
	fi

	if [[ -n "$(git branch -a --list | grep -w main | sed 's/^[* ]*//g')" ]]; then
		git checkout main --quiet

		if [ $? -eq 0 ]; then
			if [[ "$PAST_BRANCH" != "main" ]]; then
				echo "switched to branch: \e[94mmain\e[0m";
			fi
		fi

		return 0;
	fi

	echo "no branch was found: main";
}

# checkout stage branch
stage() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	local PAST_BRANCH=$(git branch --show-current)

	if [[ -n "$(git branch -a --list | grep -w staging | sed 's/^[* ]*//g')" ]]; then
		git checkout staging --quiet

		if [ $? -eq 0 ]; then
			if [[ "$PAST_BRANCH" != "staging" ]]; then
				echo "switched to branch: \e[94mstaging\e[0m";
			fi
		fi

		return 0;
	fi

	if [[ -n "$(git branch -a --list | grep -w stage | sed 's/^[* ]*//g')" ]]; then
		git checkout stage --quiet

		if [ $? -eq 0 ]; then
			if [[ "$PAST_BRANCH" != "main" ]]; then
				echo "switched to branch: \e[94mstage\e[0m";
			fi
		fi

		return 0;
	fi

	echo "no branch was found: stage";
}

# checkout default branch defined in config
default() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	local MY_BRANCH=$(git branch --show-current)
	local DEFAULT_MAIN_BRANCH=$(git config --get init.defaultBranch)
	#local MAIN_BRANCH="${DEFAULT_MAIN_BRANCH:-main}"

	if [[ -n "$DEFAULT_MAIN_BRANCH" ]]; then
		git checkout $DEFAULT_MAIN_BRANCH --quiet

		if [ $? -eq 0 ]; then
			if [[ "$MY_BRANCH" != "$DEFAULT_MAIN_BRANCH" ]]; then
				echo "switched to branch: \e[94m$DEFAULT_MAIN_BRANCH\e[0m";
			fi

			return 0;
		fi
	fi

	echo "no default branch was found";
}

# Merging & Rebasing -----------------------------------------------------------------------=
# rebase $1 or main
rebase() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	local MY_BRANCH=$(git branch --show-current)
	local DEFAULT_MAIN_BRANCH=$(git config --get init.defaultBranch)
	local MAIN_BRANCH="${1:-$DEFAULT_MAIN_BRANCH}"

	if [[ "$MY_BRANCH" == "$DEFAULT_MAIN_BRANCH" ]]; then
		echo "\e[31mfatal:\e[0m cannot rebase in branch: $MY_BRANCH";
		return 1;
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

# merge branch $1 or default branch
merge() {
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	local MY_BRANCH=$(git branch --show-current)
	local DEFAULT_MAIN_BRANCH=$(git config --get init.defaultBranch)
	local MAIN_BRANCH="${1:-$DEFAULT_MAIN_BRANCH}"

	if [[ "$MY_BRANCH" == "$DEFAULT_MAIN_BRANCH" ]]; then
		echo "\e[31mfatal:\e[0m cannot merge in branch: $MY_BRANCH";
		return 1;
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
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

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
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	if [[ -n "$1" ]]; then
		delb1 $1
		return 0;
	fi

	if [ ! -d ".git" ]; then
		echo "\e[31mfatal:\e[0m not a project folder: $(pwd)"
		return 1;
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
	check_git; if [ ! $? -eq 0 ]; then return 1; fi

	local MY_BRANCH=$(git branch --show-current)
	local STATUS=$(git status --porcelain)

	if [[ "$1" == "$MY_BRANCH" ]]; then
		if [[ -n "$STATUS" ]]; then
			st
			echo .
			if read -qs "?delete current branch? (y/n) "; then
		    echo "y"
		    reseta
		  else
		  	echo "n"
				return 0;
		  fi
		fi

		local DEFAULT_MAIN_BRANCH=$(git config --get init.defaultBranch)

		git checkout $DEFAULT_MAIN_BRANCH -q
		git branch -D $1

		return 0;
	fi

	git branch -D $1
}
