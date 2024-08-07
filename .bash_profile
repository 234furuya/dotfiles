# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME
export GHQ_ROOT=$GOPATH/src
PATH=$PATH:$GOROOT/bin:$GOPATH/bin
