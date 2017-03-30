#!/bin/bash

clear
echo Installing Cycligent

sudo echo -e "> Test droit sudo [\033[32mOK\033[0m]"

# Download and install
wget https://s3-us-west-2.amazonaws.com/cycligent-downloads/CycligentGitTool/installers/linux/x64/CycligentGitTool-0.5.2-linux-x64.deb -O CycligentGitTool-linux-x64.deb
sudo dpkg -i CycligentGitTool-linux-x64.deb
sudo apt-get install -f
rm -f CycligentGitTool-linux-x64.deb

# Create link for command
target=/usr/bin/cycligent
if [ -f $target ]
then
  sudo rm $target
fi
sudo ln -s /usr/share/CycligentGitTool/CycligentGitTool $target

# All done
echo ---------------------------------------------------------------------------
echo Cycligent installed. Use cycligent to start, or use Desktop shortcut
echo You will need to ask for a licence.
echo -e "\033[31;1mDon't use any accentuated character in the request, it won't work.\033[0m"
echo
echo
echo 'If you want to integrate (recommended) DiffMerge in Cycligent, use:'
echo
echo 'Diff Command Line (diffmerge):'
echo -e '\033[34m    diffmerge $to $from\033[0m'
echo 'Diff Command Line (meld):'
echo -e '\033[34m    meld $to $from\033[0m'
echo Edit Command Line
echo -e '\033[34m    atom $file\033[0m'
echo 'Merge Command Line (diffmerge):'
echo -e '\033[34m    diffmerge --merge $to $common $from\033[0m'
echo 'Merge Command Line (meld):'
echo -e '\033[34m    meld --auto-merge $to $common $from\033[0m'
echo
echo
echo Next step is opening the website to request a licence. Press enter...
echo ---------------------------------------------------------------------------

read

xdg-open https://www.cycligent.com/git-tool
