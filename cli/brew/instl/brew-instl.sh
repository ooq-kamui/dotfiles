#!/bin/bash


# case ec2-user
#   pw setting
#   sudo passwd ec2-user


# 2025-04
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# confirm
brew -v


