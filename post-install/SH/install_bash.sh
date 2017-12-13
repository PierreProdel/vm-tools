#!/bin/bash

mkdir -p ~/.bashrc.d
cp -f bashrc.d/*.bashrc ~/.bashrc.d/

func_install_file() {
  if [ -f $1 ]
  then
    if grep -q "INCLUDE_BASHRCD" "$1"
    then
      echo Bash already setup.
    else
      echo Installing Bash in $1
      echo '' >> $1
      echo '# INCLUDE_BASHRCD' >> $1
      echo 'for file in ~/.bashrc.d/*.bashrc;' >> $1
      echo 'do' >> $1
      echo '  source "$file"' >> $1
      echo 'done' >> $1
    fi

    if grep -q "INCLUDE_PERSO" "$1"
    then
      echo Perso bash already setup.
    else
      echo Installing Perso bash in $1
      echo '' >> $1
      echo '# INCLUDE_PERSO' >> $1
      echo 'if [ -f $HOME/.bashrc_perso ]; then' >> $1
      echo '  . $HOME/.bashrc_perso' >> $1
      echo 'fi' >> $1
    fi
  fi
}

if [ -f ~/.bashrc_pro ]
then
  rm -f ~/.bashrc_pro
fi

if [ -f ~/.bashrc_perso ]
then
  rm -f ~/.bashrc_vmtools
fi

func_install_file "$HOME/.bashrc"
func_install_file "$HOME/.zshrc"

# All done
echo ---------------------------------------------------------------------------
echo Bash updated. Now execute the following command:
echo '       source ~/.bashrc'
echo ---------------------------------------------------------------------------
