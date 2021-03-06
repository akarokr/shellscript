#!/bin/bash

# Mini tutorial de git em forma de comando para ajudar quem está começando.
# Jogue ele no /usr/bin/ com a permissão 755.
# Para mais referências: http://rogerdudler.github.io/git-guide/index.pt_BR.html

WHITE="\033[01;37m"
NONE="\033[0m"

echo ""
echo -e "Lembre-se sempre de estar na pasta com o .git, para isso, rode um$WHITE ls -la. $NONE"
echo ""
echo "1.Para adicionar um script/programa no repo do git use:"
echo -e "$WHITE git add <nome do arquivo>$NONE"
echo ""
echo "2.Após isso, dê um commit com o seguinte comando:"
echo -e "$WHITE git commit -m <alguma mensagem>$NONE"
echo ""
echo "3.Depois dê um push para empurar o arquivo para o repo"
echo -e "$WHITE git push -u origin master $NONE"
echo ""
echo "Caso o repositório ainda não exista, crie um repositório no site (e.g. github, bit bucket, etc) e depois dê o seguinte comando:"
echo ""
echo "1.Iniciar o repositório:"
echo -e "$WHITE git init $NONE"
echo ""
echo "2.Adicionar o repositóio já criado na sua máquina:"
echo -e "$WHITE git remote add origin git@github.com:usuario/repositorio.git $NONE"
echo ""
echo "3.Baixar o repositório:"
echo -e "$WHITE git pull origin master $NONE"
