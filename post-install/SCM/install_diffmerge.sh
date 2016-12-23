#!/bin/bash

echo Installing DiffMerge

sudo echo "> Test droit sudo [OK]"

# Download and install
wget http://download-us.sourcegear.com/DiffMerge/4.2.0/diffmerge_4.2.0.697.stable_amd64.deb
sudo dpkg -i diffmerge_4.2.0.697.stable_amd64.deb
sudo apt-get install -f
rm -f diffmerge_4.2.0.697.stable_amd64.deb

# Integrates in git
# From https://sourcegear.com/diffmerge/webhelp/sec__git__linux.html
git config --global diff.tool diffmerge
git config --global difftool.diffmerge.cmd "diffmerge \"\$LOCAL\" \"\$REMOTE\""
git config --global merge.tool diffmerge
git config --global mergetool.diffmerge.trustExitCode true
git config --global mergetool.diffmerge.cmd "diffmerge --merge --result=\"\$MERGED\" \"\$LOCAL\" \"\$BASE\" \"\$REMOTE\""

# All done
echo ---------------------------------------------------------------------------
echo DiffMerge installed and integrated with git command line
echo Use diffmerge or use desktop shortcut
echo ---------------------------------------------------------------------------
