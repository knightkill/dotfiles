# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="omz reload"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias compile="commit 'compile'"
alias version="commit 'version'"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias projects="cd $HOME/Code"
alias sites="cd $HOME/Herd"

# Laravel
alias a="herd php artisan"
alias fresh="herd php artisan migrate:fresh --seed"
alias tinker="herd php artisan tinker"
alias seed="herd php artisan db:seed"
alias serve="herd php artisan serve"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="herd composer"
alias php="herd php"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run dev"

# Docker
alias docker-composer="docker-compose"

# Git
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force-with-lease"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias prune="git fetch --prune"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"


# Alias
alias vim='nvim'
alias brewr='arm brew'
alias c='composer'
alias cgu='c global update'
alias bs='brew search'
alias bi='brew install'
alias bc='brew install --cask'
alias pa='php artisan'
alias sail='bash vendor/bin/sail'
alias s='sail'
alias sa='sail artisan'
alias sc='sail composer'
alias sn='sail npm'
alias z='vim ~/.zshrc && source ~/.zshrc'
alias phpunit="./vendor/bin/phpunit"
alias wp_s="sh $DOTFILES/scripts/setupwp.sh"
alias wp_r="sh $DOTFILES/scripts/removewp.sh"
alias popdb="sh $DOTFILES/scripts/remove_dbs.sh"
alias n="npm"
alias v="valet"
alias vu="valet unlink"
alias phpcv="sh $DOTFILES/scripts/phpcv.sh"
alias pint="./vendor/bin/pint"
alias pest="./vendor/bin/pest"
alias gcm="git commit -m"
alias gst="git status"
alias gbr="git branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
alias gsave="git add -A && git commit -m 'chore: commit save point'"
alias gundo="git reset HEAD~1"
alias glog="git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30"
alias nx="yarn nx"
alias d="docker exec"
alias dc="docker compose"
alias cll="truncate -s 0 ./storage/logs/laravel.log"