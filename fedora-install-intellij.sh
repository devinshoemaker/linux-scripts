# Install IntelliJ Ultimate on Fedora 25

## Download from website 
wget https://download.jetbrains.com/idea/ideaIU-2017.1.4.tar.gz

## Extract tar.gz
tar -xzf idea*.tar.gz 
cd idea*

## Install to opt
sudo mkdir -p /opt/jetbrains/idea
sudo cp -r * /opt/jetbrains/idea/

## Add to PATH
export PATH=$PATH:/opt/jetbrains/idea/bin >> ~/.bashrc

## Create desktop launcher
cat << EOF > ~/.local/share/applications/intellij-idea-ultimate.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Terminal=false
Type=Application
Name=IntelliJ IDEA Ultimate
Exec=/opt/jetbrains/idea/bin/idea.sh
Icon=/opt/jetbrains/idea/bin/idea.png
EOF

## Clean up
cd ../
rm -rf idea*
