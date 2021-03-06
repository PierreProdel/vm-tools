alias get-vm-tools='func_get-vm-tools'

func_get-vm-tools() {

  if [ "$#" -eq 1 ]; then

    if [ "$1" = "-v" ]; then
      echo -e "$(cat ~/.vm-tools-version)"
    fi

  else

    # Check that jq is installed
    command -v jq >/dev/null 2>&1 || {
      echo "jq is needed. Installing jq...";
      sudo apt-get -y install jq
    }

    clear

    # Fetch content from GitHub

    curl -is https://api.github.com/users/whatever > github_headers
    remaining_tokens=`grep X-RateLimit-Remaining: github_headers | sed -e "s/X-RateLimit-Remaining: //" | sed -e "s/\r//"`
    reset_time=`echo $github_headers | grep X-RateLimit-Reset: github_headers | sed -e "s/X-RateLimit-Reset: //" | sed -e "s/\r//"`
    reset_date=`date -d @$reset_time`
    if [ $remaining_tokens -gt 1 ]
    then
    {
        echo -e "[\033[32mOK\033[0m] $remaining_tokens github tokens remaining"
    }
    else
    {
        echo -e "[\033[31mERR\033[0m] No github token available. Try again after $reset_date"
        return 1
    }
    fi
    rm -f github_headers

    content=`curl -s https://api.github.com/repos/SogetiATC/vm-tools/releases/latest`
    url=`echo $content | jq -r ". | .tarball_url"`
    version=`echo $content | jq -r ". | .tag_name"`
    name=`echo $content | jq -r ". | .name"`
    changelog=`echo $content | jq -r ". | .body"`
    echo "########################################################################"
    echo -e "#  Installing VM Tools \033[34;1m$version\033[0m (codename \033[34;1m$name\033[0m)"
    echo "########################################################################"

    # Download scripts from GitHub
    mkdir -p /tmp/vmt
    cd /tmp/vmt
    file=vm-tools.tar.gz
    wget -nv $url -O $file

    # Untar and install scripts
    tar zxf $file
    infolder=`find . -type d -name post-install`
    outfolder=~/vm-tools
    rm -rf $outfolder
    mkdir -p $outfolder
    cp -rf $infolder/* $outfolder
    cd -

    # Cleanup temp files
    rm -rf /tmp/vmt

    # Install newest version of aliases and tools
    cd ~/vm-tools/SH
    ./update_essentials.sh
    ./install_bash.sh
    cd -

    # All done
    echo ""
    echo "########################################################################"
    echo -e "VM Tools updated to \033[34;1m$version\033[0m (codename \033[34;1m$name\033[0m)"
    echo "Changelog :"
    echo -e "\033[1m$changelog\033[0m"
    echo -e "##################################################################\033[34;1m" > ~/.vm-tools-version
    echo '  ___    _______  ___   ________           ______       ' >> ~/.vm-tools-version
    echo '  __ |  / /__   |/  /   ___  __/______________  /_______' >> ~/.vm-tools-version
    echo '  __ | / /__  /|_/ /    __  /  _  __ \  __ \_  /__  ___/' >> ~/.vm-tools-version
    echo '  __ |/ / _  /  / /     _  /   / /_/ / /_/ /  / _(__  ) ' >> ~/.vm-tools-version
    echo '  _____/  /_/  /_/      /_/    \____/\____//_/  /____/  ' >> ~/.vm-tools-version
    echo -e "\033[0m" >> ~/.vm-tools-version
    echo "  vm-tools version : \033[32m$version - $name\033[0m" >> ~/.vm-tools-version
    echo "  See \033[34mhttps://github.com/SogetiATC/vm-tools\033[0m for more information" >> ~/.vm-tools-version
    echo "  Aliases are documented in ~/.bashrc_pro" >> ~/.vm-tools-version
    echo "##################################################################" >> ~/.vm-tools-version

  fi
}

# Display VM Tools info in terminal
get-vm-tools -v
