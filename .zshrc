export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  ruby
  node
  dnf
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export ARCHFLAGS="-arch $(uname -m)"

alias n=nvim
alias dcd='docker compose down'

export PATH=/opt/homebrew/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export rvm_silence_path_mismatch_check_flag=1

export PATH="$HOME/.rvm/gems/ruby-3.2.2/bin:$HOME/.rvm/gems/ruby-3.2.2@global/bin:$HOME/.rvm/rubies/ruby-3.2.2/bin:$HOME/.rvm/bin:$PATH"

function ruby_prompt_info() {
  if [ -f Gemfile ] || [ -f .ruby-version ]; then
    echo "%{$fg[red]%}($(ruby -v | cut -d' ' -f2)@$(rvm current | cut -d'@' -f2))%{$reset_color%} "
  fi
}

PROMPT='$(ruby_prompt_info)'$PROMPT
export PATH="/Applications/Hyper.app/Contents/MacOS:$PATH"

# Load local configuration (ignored by git)
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi