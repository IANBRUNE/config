# If you come from bash you might have to change your $PATH.
export ANDROID_HOME=/Users/ianbrune/Library/Android/sdk
export PATH=$HOME/bin:/usr/local/bin:$ANDROID_HOME/platform-tools:$PATH
export PATH=~/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export idea=/usr/local/bin/idea
export ZSH=/Users/ianbrune/.oh-my-zsh
export REACT_EDITOR=code
export FIREFOX_HOME=/Applications/Firefox.app/Contents/MacOS/firefox

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home
eval $(thefuck --alias)

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sunrise"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws git-extras)

source $ZSH/oh-my-zsh.sh


####################
#     WORKSPACE    #
####################

alias ll="ls -l"
alias work='cd ~/Workspace'

alias zshconfig="code ~/.zshrc"
alias sourcez='source ~/.zshrc'
alias ohmyzsh="code ~/.oh-my-zsh"

alias firefox-debug='$FIREFOX_HOME  --start-debugger-server'


####################
#        GIT       #
####################

push-new-branch() {
    git checkout -b $1
    branch=$(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream origin $branch
}

merge-from-master() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    git checkout master
    git pull
    git checkout $branch
    git merge origin/master
}

alias diff='git diff | gitx'
alias mm='merge-from-master'

alias pn='push-new-branch'

alias delete-merged='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'


####################
#        KCL       #
####################

start-krazydevs() {
    cd ~/workspace/www.krazydevs.com
    yarn
    yarn start
}

alias krazydevs="start-krazydevs"
