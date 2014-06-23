export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i

# Add stuff to path
export PATH=~/.bin:$PATH

# Add GOPATH
export GOPATH=~/code/go/

# Add bins of GOPATHs
export PATH=$PATH:$GOPATH/bin

# Add path of GOVIMROOT
export GOVIMROOT=$(go env | grep GOROOT | cut -d\" -f2)
