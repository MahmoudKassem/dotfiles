#set default editor, terminal and browser
export EDITOR="vim"
export TERMINAL="xfce4-terminal"
export BROWSER="brave"
export POSTGREST_TEST_CONNECTION="postgres://postgrest_test_authenticator:qesfB3jOpD23whSA@localhost:5432/test"
export PATH="$PATH:/usr/bin/stylish-haskell"

#enable vi keybindings
set -o vi

#enable powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
