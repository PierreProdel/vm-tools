#!/bin/bash

cp -f .bashrc_pro ~/

if grep -q "INCLUDE_PRO" "$HOME/.bashrc"
then
  echo Pro bash already setup, updating file...
else
  cp ~/.bashrc ~/.bashrc.orig
  echo '' >> ~/.bashrc
  echo '# INCLUDE_PRO' >> ~/.bashrc
  echo 'if [ -f $HOME/.bashrc_pro ]; then' >> ~/.bashrc
  echo '  . $HOME/.bashrc_pro' >> ~/.bashrc
  echo 'fi' >> ~/.bashrc
fi

cp -f .bashrc_vmtools ~/

if grep -q "INCLUDE_VMTOOLS" "$HOME/.bashrc"
then
  echo VM bash already setup, updating file...
else
  cp ~/.bashrc ~/.bashrc.orig
  echo '' >> ~/.bashrc
  echo '# INCLUDE_VMTOOLS' >> ~/.bashrc
  echo 'if [ -f $HOME/.bashrc_vmtools ]; then' >> ~/.bashrc
  echo '  . $HOME/.bashrc_vmtools' >> ~/.bashrc
  echo 'fi' >> ~/.bashrc
fi

if [ ! -f $HOME/.bashrc_perso ]; then
  touch $HOME/.bashrc_perso
fi

if grep -q "INCLUDE_PERSO" "$HOME/.bashrc"
then
  echo Perso bash already setup...
else
  cp ~/.bashrc ~/.bashrc.orig
  echo '' >> ~/.bashrc
  echo '# INCLUDE_PERSO' >> ~/.bashrc
  echo 'if [ -f $HOME/.bashrc_perso ]; then' >> ~/.bashrc
  echo '  . $HOME/.bashrc_perso' >> ~/.bashrc
  echo 'fi' >> ~/.bashrc
fi

# All done
echo ---------------------------------------------------------------------------
echo Bash updated. Now execute the following command:
echo '       source ~/.bashrc'
echo ---------------------------------------------------------------------------
