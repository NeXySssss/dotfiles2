export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE=-
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet

export PATH="$PATH:$HOME/.local/bin"

export TERMINAL="kitty"
export EDITOR="nvim"
export PAGER="less"

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_USE_PORTAL=1
#export MOZ_X11_EGL=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export _JAVA_AWT_WM_NONREPARENTING=1
