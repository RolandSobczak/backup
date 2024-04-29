#!/bin/bash

apt update

apt install -y pipx

pipx install --include-deps ansible

echo 'export PATH="$PATH:/root/.local/bin"' >> /root/.bashrc
