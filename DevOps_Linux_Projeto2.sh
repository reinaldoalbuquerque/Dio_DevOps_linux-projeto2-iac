#!/bin/bash
echo "Atualizando o servidor..."
apt-get update > /dev/null
apt-get upgrade -y > /dev/null
#instalacao de pacotes que sao pre-requisitos
apt-get install unzip wget -y > /dev/null

echo "Verificando se o Apache2 esta instalado..."
dpkg -l|grep -i apache2 > /dev/null

if [ "$?" -ne "0" ]
then
  echo "Apache nao esta instalado, instalando Apache2"
  echo "Aguarde..."
  apt-get install apache2 -y > /dev/null
else
  echo "Apache2 ja esta instalado"
fi

echo "Baixando aplicacao..."
wget -nv --show-progress https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip > /dev/null

echo "Descompactando..."
unzip -qq main.zip

echo "copiando arquivos..."
cp -rf linux-site-dio-main/* /var/www/html
echo "apagando arquivos temporarios"
rm -rf linux-site-dio-main
rm -rf main.zip

echo "Instalacao finalizada!"