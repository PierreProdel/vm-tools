#!/bin/bash

mkdir -p ~/.bashrc.d
cp -f *.bashrc ~/.bashrc.d/

if [ -f ~/.bashrc_pro ]
then
  rm -f ~/.bashrc_pro
fi

if [ -f ~/.bashrc_perso ]
then
  rm -f ~/.bashrc_vmtools
fi

if grep -q "INCLUDE_BASHRCD" "$HOME/.bashrc"
then
  echo Bash already setup.
else
  echo '' >> ~/.bashrc
  echo '# INCLUDE_BASHRCD' >> ~/.bashrc
  echo 'for file in ~/.bashrc.d/*.bashrc;' >> ~/.bashrc
  echo 'do' >> ~/.bashrc
  echo '  source "$file"' >> ~/.bashrc
  echo 'done' >> ~/.bashrc
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
