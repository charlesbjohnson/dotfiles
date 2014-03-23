# Changes to path reflected in dmenu_run
export PATH=$PATH:/opt/java/bin

# Improve Java font rendering
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# Use base 16 terminal colors (in tmux as well)
source $HOME/.termcolor/base16-shell/base16-solarized.dark.sh
alias tmux="TERM=screen-256color-bce tmux"
