#!/bin/bash

distro=$(cat /etc/os-release)

pattern="(ID|id)=(ubuntu|fedora)"

if [[ $distro =~ $pattern && "${BASH_REMATCH[2]}" == "fedora" ]]; 
then
  sudo dnf update
  sudo dnf install -y pipx
elif [[ $distro =~ $pattern && "${BASH_REMATCH[2]}" == "ubuntu" ]]; then
  sudo apt update
  sudo apt install -y pipx
else
  echo "OS version doesn't supported. Avaible support for: 'fedora', 'ubuntu'"
  exit -1
fi

export PATH="$PATH:${HOME}/.local/bin"
pipx install --include-deps ansible
echo 'export PATH="$PATH:${HOME}/.local/bin"' >> ${HOME}/.bashrc

ansible-playbook --ask-vault-pass src/desktop.yml

