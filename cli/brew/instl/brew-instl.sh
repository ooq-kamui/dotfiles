#!/bin/bash

# case ec2-user
#   pw setting
#   sudo passwd ec2-user


# 2025-04
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /home/ec2-user/.bashrc

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/ec2-user/.bashrc

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# confirm
brew -v


