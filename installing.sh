#!/bin/bash
#verificando se o docker ja esta instasado
installDCK(){
  #INSTALANDO O DOCKER
  sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common; wait;


    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - ; wait;

    sudo apt-key fingerprint 0EBFCD88; wait;

    sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

    sudo apt-get update; wait;
    sudo apt install -y docker-ce docker-ce-cli containerd.io

}


echo "Installação de dependências necessárias para iniciar o OS KDE ^^"


sudo apt update;
#zsh
sudo apt  install zsh;

#java
sudo apt install default-jre



DOCKERNULL=$(dpkg -l | grep docker-engine )
if [ -z $DOCKERNULL ]
then
  installDCK;

else
  #REMOVENDO O DOCKER já instalado
  #sudo apt-get remove docker docker-engine docker.io containerd runc
  #INSTALLDOCKER;
  echo "aa"
fi


VGNULL=$(apt list vagrant)

if [[ $VGNULL == "Listing... Done" ]];
then
  wget "https://releases.hashicorp.com/vagrant/2.2.10/vagrant_2.2.10_x86_64.deb"
  sudo dpkg -i "vagrant_2.2.10_x86_64.deb"
else
  echo "instalado já :D"
fi


GITNULL=$(apt list git)

if [[ $GITNULL == "Listing... Done" ]];
then
  sudo apt install -y git
else
  echo "instalado já :D"
fi




#Instala o ansible
sudo apt install -y ansible


#instala o terraform
wget https://releases.hashicorp.com/terraform/0.13.2/terraform_0.13.2_linux_amd64.zip
sudo unzip terraform_0.13.2_linux_amd64.zip
mv ./terraform_0.13.2_linux_amd64.zip /usr/local/bin
TFNULL=$(which terraform)
if [ TFNULL == "/usr/local/bin/terraform" ]
then
  echo "It's Ok :P"
fi
