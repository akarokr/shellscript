#!/usr/bin/env zsh

GREEN="\033[0;32m"
RED="\033[0;31m"
NONE="\033[0m"
text_input=$1

echo -n $text_input | egrep "\/"
std_type=$?

if [ $std_type -eq 0 ]; then
  plugin_novo=$(echo $text_input | awk -F '/' '{print $2}')
  echo "installing " $plugin_novo
else
  plugin_novo=$text_input
  echo "installing " $plugin_novo
fi

if [ -z ~/.zshrc ]; then
#    echo "enter the .zshrc fullpath"
    exit 1
fi

if [ -z $plugin_novo ]; then
    #echo "enter the name of the plugin"
    exit 1
fi

encoding=$(file ~/.zshrc | egrep "CRLF")

if [ ! -z "$encoding" ]; then
#    echo "codification not valid, convert to ASCII text"
    exit 1
fi

orig_plugin=( $(awk -F " " '/^plugins=/{print }' ~/.zshrc | sed 's/^plugins=//g;s/(//g;s/)//g') )

# Apaga linha que começa com a palavra plugins=
sed -i '/^plugins=/d' ~/.zshrc
echo "plugins=(${orig_plugin[@]} $plugin_novo)" >> ~/.zshrc
source ~/.zshrc

if [ $? -eq 0 ]; then
  positivo=$(echo -e $GREEN"✓"$NONE)
  echo $plugin_novo "plugin installed" $positivo
elif [ $? -eq 2 ]; then
  negativo=$(echo -e $RED "✓" $NONE)
  echo $plugin_novo "plugin  not installed" $negativo
fi

exit 0
