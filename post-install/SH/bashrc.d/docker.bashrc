# Aliases Docker
alias dps='docker ps -a'
alias dim='docker images'
alias drm='docker ps -a|sed "1 d"|awk '"'"'{print $1}'"'"'|xargs docker rm'
alias drmi='docker images|sed "1 d"|grep \<none\>|awk '"'"'{print $3}'"'"'|sort|uniq|xargs docker rmi'
alias dstop='docker stop'
alias dstart='docker start'
alias dstopall='docker ps -a| sed "1 d" | awk '"'"'{print $1}'"'"' | xargs docker stop'
alias dstartall='docker ps -a| sed "1 d" | awk '"'"'{print $1}'"'"' | xargs docker start'
alias ddf='docker system df -v'

# Docker compose
alias dco='docker-compose'
alias komp='kompose'

# Open a bash session in a container
alias dsh='func_dsh'

# Get host IP adress from a docker container
alias dip='func_dip'
alias docker-full-cleanup='func_full-cleanup-docker'

alias dco-upd='func_upd-docker-compose'
alias dco-op='xdg-open https://github.com/docker/compose/releases'
alias komp-upd='func_upd-kompose'
alias komp-op='xdg-open https://github.com/kubernetes/kompose/releases'


# Advanced aliases
func_dsh() {
  docker exec -it $1 bash
}

func_dip() {
  docker exec $1 /sbin/ip route|awk '/default/ { print $3 }'
}

func_upd-docker-compose() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: dco-upd <docker-compose version>"
    echo "Use dco-op to get the latest version"
  else
    sudo curl -L https://github.com/docker/compose/releases/download/$1/docker-compose-`uname -s`-`uname -m` > dco
    sudo cp -f dco /usr/local/bin/docker-compose
    rm -f dco
    sudo chmod +x /usr/local/bin/docker-compose
  fi
}

func_upd-kompose() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: komp-upd <kompose version>"
    echo "Use komp-op to get the latest version"
  else
    sudo curl -L https://github.com/kubernetes/kompose/releases/download/v1.1.0/kompose-linux-amd64 -o /usr/local/bin/kompose
    sudo chmod +x /usr/local/bin/kompose
  fi
}

func_full-cleanup-docker() {

  echo "WARN: This will remove everything from docker: volumes, containers and images. Will you dare? [y/N] "
  read choice

  if [ \( "$choice" == "y" \) -o \( "$choice" == "Y" \) ]
  then
    sudo echo "> Test droit sudo [OK]"
    sizea=`sudo du -sh /var/lib/docker/aufs`

    echo "Stopping all running containers"
    containers=`docker ps -a -q`
    if [ -n "$containers" ]
    then
      docker stop $containers
    fi

    echo "Removing all docker images and containers"
    docker system prune -f

    echo "Stopping Docker daemon"
    sudo service docker stop

    echo "Removing all leftovers in /var/lib/docker (bug #22207)"
    sudo rm -rf /var/lib/docker/aufs
    sudo rm -rf /var/lib/docker/image/aufs
    sudo rm -f /var/lib/docker/linkgraph.db

    echo "Starting Docker daemon"
    sudo service docker start

    sizeb=`sudo du -sh /var/lib/docker/aufs`
    echo "Size before full cleanup:"
    echo "        $sizea"
    echo "Size after full cleanup:"
    echo "        $sizeb"
  fi
}
