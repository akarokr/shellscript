#!/usr/bin/env bash

export LC_ALL=C
export PATH=/bin:/usr/bin:/sbin:/usr/sbin

#lista_plugin=$(egrep -o "plugins=\(.*\)" ~/.zshrc | egrep -o "\(.*\)" | egrep -o "([[:alnum:]]|\-|[[:blank:]]|_)+")
#orig_plugin=$(egrep "plugins\=\(git\ last\-working\-dir\)" ~/.zshrc)
orig_plugin=( $(awk -F " " '/plugins=/{print }' ~/.zshrc | sed 's/plugins=//g;s/(//g;s/)//g') )
input_text=$1
tmpzsh="/home/lmoura/exemplo"

newplugin=$(echo "plugins=($lista_plugin $input_text)")

echo ""
echo "list_plugin: "$lista_plugin
echo ""
echo "orig_plugin: "$orig_plugin
echo ""
echo "input_text: "$input_text
echo ""
echo "newplugin: "$newplugin
echo ""

# Apaga linha que começa com a palavra plugins=
#sed -i '/^plugins=/d' ~/.zshrc
#echo "plugins=(${orig_plugin[@]} $plugin_novo)" >> ~/.zshrc

#/bin/sed -i "s/plugins\=\(git\ last\-working\-dir\)/plugins\=\(qualquer\ merda\)/g" /home/lmoura/shellrc
