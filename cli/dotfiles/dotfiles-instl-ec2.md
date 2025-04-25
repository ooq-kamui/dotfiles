
# dotfiles


## install

```
mkdir -p ~/wrk/prj-pri
```

```
cd ~/wrk/prj-pri
```

```
sudo passwd ec2-user
```


### git

```
sudo yum update
```

```
sudo yum install git
```

```
git clone https://github.com/ooq-kamui/dotfiles
```

### bash

```
echo "" >> ~/.bashrc
echo "source ~/wrk/prj-pri/dotfiles/sh/bash/bashrc/dflt/.bashrc" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "source ~/wrk/prj-pri/dotfiles/sh/bash/bashrc/c9/.bashrc" >> ~/.bashrc
echo "" >> ~/.bashrc
```

```
source ~/.bashrc
```

### brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```
echo "" >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
echo "" >> ~/.bashrc
```

```
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

```
brew -v
```


### nvim

```
brew install neovim
```

```
mkdir -p ~/.config/nvim
```

```
ln -sin ~/wrk/prj-pri/dotfiles/nvim/scrpt/dflt/init.vim ~/.config/nvim/init.vim
```

```
ln -sin ~/wrk/prj-pri/dotfiles/nvim/scrpt/dflt/lua ~/.config/nvim/lua
```

```
ln -sin ~/wrk/prj-pri/dotfiles/nvim/syntax/c9 ~/.config/nvim/syntax
```

vim-plug

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

```
vi
```

```
:PlugInstall
```

```
:q
```


### zoxide

```
wip:
```


### fd

```
wip:
```


### rg

```
wip:
```


### fzf

```
wip:
```


### fish

```
wip:
```



