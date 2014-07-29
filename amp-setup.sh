#!/bin/bash

## installs and sets up homebrew, apache, mysql, and php on a mac

# echo ''
# echo 'Installing and configuring Homebrew.'
# echo ''

# # install homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# echo ''
# echo 'Checking system and updating Homebrew.'
# echo ''

# # set up homebrew
# brew doctor
# brew update
# brew upgrade

# echo ''
# echo 'Installing PHP.'

# # tap some brew and install php
# brew tap homebrew/dupes
# brew tap homebrew/versions
# brew tap homebrew/homebrew-php
# brew install php55

# echo ''
# echo 'PHP successfully installed.'
# echo ''

# create php.ini from default if it doesn't exist
if [ ! -f /etc/php.ini ]; then
    sudo cp /etc/php.ini.default /etc/php.ini
	echo 'Copying a new php.ini as you don'\''t have one yet.'
fi

echo ''
echo 'Setting PHP timezone.'
echo ''

# append date.timezone line to php.ini
sudo sed -i '' '$ a\
date.timezone = "America/New_York"
' /etc/php.ini

# # make apache use the php 5 module
# echo 'setting apache up for php5 module'
# echo ''
# sed -i 's,#LoadModule php5_module /etc/apache2/libphp5.so,LoadModule php5_module /etc/apache2/libphp5.so,g' httpd.conf