#!/bin/bash -e
# IMPORTANT. My phpstom installation exists on /opt/phpstorm.
# IMPORTANT. Run with sudo!
# Early Access program: https://confluence.jetbrains.com/display/PhpStorm/PhpStorm+Early+Access+Program

echo -n "Please enter the PhpStorm download url (eg http://download.jetbrains.com/webide/PhpStorm-EAP-141.690.tar.gz): "
read url
 
# Download file from url
echo "Downloading PhpStorm to ~/Downloads"
cd ~/Downloads
mkdir PhpStorm-EAP

wget --no-check-certificate -O phpstorm.tar.gz ${url}
tar -xzvf ~/Downloads/phpstorm.tar.gz -C ~/Downloads/PhpStorm-EAP
rm ~/Downloads/phpstorm.tar.gz

# Remove old Phpstorm
echo "Removing old PhpStorm"
rm -rf ~/apps/PhpStorm-EAP

# Copy new Phpstorm
echo "Copying new PhpStorm"
mv ~/Downloads/PhpStorm-EAP ~/apps/PhpStorm-EAP

# Finish
echo "New PhpStorm has been installed!"
