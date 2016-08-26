#!/bin/sh

# This script will setup Evm (Emacs Version Manager) and Cask on
# Travis to use for Emacs Lisp testing.
#
# In .travis.yml, add this:
#
#  - curl -fsSkL https://gist.github.com/rejeep/ebcd57c3af83b049833b/raw > x.sh && source ./x.sh
#
# Emacs 24.3 is installed in the above script because Cask requires
# Emacs 24 to be installed. Because of this, when installing other
# environments in the .travis.yml configuration, use the --skip
# option, for example:
#
#  - evm install $EVM_EMACS --use --skip

export PATH="$HOME/.cask/bin:$HOME/.evm/bin:$PATH"

git clone https://github.com/rejeep/evm.git "$HOME/.evm"
evm config path /tmp
evm install emacs-24.5-travis --use --skip

curl -fsSkL https://raw.github.com/cask/cask/master/go | python
