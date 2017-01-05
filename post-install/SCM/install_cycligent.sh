#!/bin/bash
echo Installing Cycligent

sudo echo "> Test droit sudo [OK]"

# Download and install
wget https://s3-us-west-2.amazonaws.com/cycligent-downloads/CycligentGitTool/installers/linux/x64/CycligentGitTool-0.4.3-linux-x64.deb -O CycligentGitTool-linux-x64.deb
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
echo You will need to ask for a licence. Don't use any accentuated character
echo in the request, it won't work.
echo
echo
echo 'If you want to integrate (recommended) DiffMerge in Cycligent, use:'
echo
echo 'Diff Command Line (diffmerge):'
echo '    diffmerge $to $from'
echo 'Diff Command Line (meld):'
echo '    meld $to $from'
echo Edit Command Line
echo '    atom $file'
echo 'Merge Command Line (diffmerge):'
echo '    diffmerge --merge $to $common $from'
echo 'Merge Command Line (meld):'
echo '    meld --auto-merge $to $common $from'
echo
echo
echo Next step is opening the website to request a licence. Press enter...
echo ---------------------------------------------------------------------------

read

xdg-open https://www.cycligent.com/git-tool
