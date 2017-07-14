# Install IntelliJ Ultimate on Fedora 25

## Download from website 
wget https://download.jetbrains.com/idea/ideaIU-2017.1.4.tar.gz

## Extract tar.gz
tar -xzf idea*.tar.gz 
cd idea*

## Install to opt
sudo mkdir -p /opt/jetbrains/idea
sudo cp -r * /opt/jetbrains/idea/

## Clean up
cd ../
rm -rf idea*
