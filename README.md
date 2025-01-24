# Windows:
- Add `source ~/.bashrc;` to the end of file`C:\Program Files\Git\etc\bash.bashrc`;
- Create `C:\Users\LT\.bashrc` file:
  ```bash
  # Launch Zsh
  if [ -t 1 ]; then
    exec zsh
  fi
  ```
- Update `C:\Program Files\Git\etc\zsh\zshenv`:
  ```bash
  if [[ -z "$XDG_CONFIG_HOME" ]]
  then
      export XDG_CONFIG_HOME="/c/Users/LT"
  fi

  # echo "$XDG_CONFIG_HOME"

  if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
  then
      # double check by run `echo $ZDOTDIR`
      export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
  fi
  ```
# Mac
- `echo $SHELL`: check which kind of shell is running (`bash` or `zsh`).
- `which zsh`:
- move zsh config files to `.config` folder
  - `mkdir zsh`
  - `mv .zshrc .config/zsh`
  - `zshenv` is always sourced first, so it allows us to set the `ZDOTDIR` that means that we can tell it don't look into our home directory, look into our `.config/zsh` directory that's where you're going to find all of our configurations. Update or create `zshenv` in `/etc` directory.
    ```bash
    if [[ -z "$XDG_CONFIG_HOME" ]]
    then
        export XDG_CONFIG_HOME="$HOME/.config"
    fi

    if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
    then
        # double check by run `echo $ZDOTDIR`
        export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
    fi
    ```
- [powerlevel10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#manual)
  - `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZDOTDIR/powerlevel10k
`
  - `mkdir plugins` create the `plugins` directory
  - `mv powerlevel10k plugins`: move powerlevel10k to plugins directory
  - `source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme`: add to `.zshrc` then restart the terminal to configure powerlevel10k
- `aliasrc`: create aliasrc to setup alias command, then add the following code to `.zshrc` file.
  ```bash
    # load aliasrc if it exists
    [ -f "${ZDOTDIR}/aliasrc" ] && source "${ZDOTDIR}/aliasrc"
  ```
- [zsh-autosuggestions/](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
  - `git clone https://github.com/zsh-users/zsh-autosuggestions $ZDOTDIR/plugins/zsh-autosuggestions` install
  - `source ${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh` add following line to `.zshrc`file.

# [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting?tab=readme-ov-file#manual)
- `git clone https://github.com/z-shell/F-Sy-H ${ZDOTDIR}/plugins/f-sy-h` install
- `source ${ZDOTDIR}/plugins/f-sy-h/F-Sy-H.plugin.zsh`


# [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
- `git clone https://github.com/zsh-users/zsh-history-substring-search ${ZDOTDIR}/plugins/zsh-history-substring-search`
- `source ${ZDOTDIR}/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh`


# Reference
- https://www.youtube.com/watch?v=rgdR27KMxpo