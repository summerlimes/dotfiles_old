# Getting OS name
name=`uname`

# MAC PATH
if [ "$name" = "Darwin" ]
then
	export PATH=/Users/fahim/anaconda/bin:/opt/X11/bin:/Library/TeX/texbin:/Users/fahim/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
fi

# fzf and ripgrep
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# bindkey -s '"\C-p": vim $(fzf);'

# base16 color
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# iterm2 header color set to dracula
echo -e "\033]6;1;bg;red;brightness;40\a"
echo -e "\033]6;1;bg;green;brightness;42\a"
echo -e "\033]6;1;bg;blue;brightness;54\a"

# zplug plugins
export ZPLUG_HOME=~/zplug
source $ZPLUG_HOME/init.zsh

# theme
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme

# utility plugins 
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions", as:plugin
zplug "zsh-users/zsh-history-substring-search", as:plugin
zplug "zsh-users/zsh-autosuggestions", as:plugin
zplug "felixgravila/zsh-abbr-path", as:plugin
zplug "supercrabtree/k", as:plugin

# oh my zsh plugins
zplug "plugins/git", from:oh-my-zsh

zplug check || zplug install
zplug load 

# dotfiles alias
alias dotfiles="git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"

# application based aliases
alias v="nvim"
alias l="k"
alias chrome="/usr/bin/open -a '/Applications/Google Chrome.app'"
alias safari="/usr/bin/open -a '/Applications/Safari.app'"

# Aliases to make life easier
alias zconf="nvim ~/.zshrc"
alias vconf="nvim ~/.config/nvim/init.vim"
alias tconf="nvim ~/.tmux.conf"

# tmux aliases
alias tmux="TERM=xterm-256color tmux"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tl="tmux ls"
alias tk="tmux kill-session -t"

# igem wiki generator aliases
alias iwikiyml="igemwiki upload-conf -n Toronto --conf igemwiki-conf.yaml"
alias iwikipage="igemwiki upload -n Toronto --type page --source"
alias iwikitemplate="igemwiki upload -n Toronto --type template --source"
alias iwikijs="igemwiki upload -n Toronto -f --type script --source"
alias iwikicss="igemwiki upload -n Toronto --type stylesheet --source"
alias iwikiimg="igemwiki upload -n Toronto -f --type image --source"

# python aliases
alias p="python"

# django alias
alias pmp="python manage.py"
alias mkmig="makemigrations"
alias mig="migrate"

# git aliases
alias glpd="git log --graph --pretty=format:'%Cred%h | %Cgreen%ad %Cblue<%an>  %n%Creset%s%n'"
# use glol from omz git plugin
# alias glp="git log --graph --pretty=format:'%Cred%h %Creset- %s %Cgreen(%ar) %Cblue<%an> '"

function _git_ignore_add(){
	GREEN='\033[0;32m'
	NC='\033[0m'
	gitignoreFile="$( git rev-parse --show-toplevel )/.gitignore"
	for addition in "$@"
	do
		echo ${addition} >> ${gitignoreFile}
		echo -e "Added ${GREEN}${addition}${NC} to gitignore" 
	done
}

alias gia="_git_ignore_add" 