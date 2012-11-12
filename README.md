Vagrant + Chef + LAMP. At the very the least, idea is to replace the need for XAMPP.

# Install on Windows

## Install the basics

Download and install Git http://git-scm.com/download/win
When installing, select all of the defaults
Download Ruby Installer for Windows http://rubyinstaller.org/ †
Download VirtualBox for windows https://www.virtualbox.org/wiki/Downloads ‡


## Make sure Ruby is installed

If you run the command ruby -v, you should see a version number printed on the next line
If not, you will need to add ruby to your path: PATH=$PATH:/c/Ruby193/bin ††
Try the command ruby -v again. This time, you should see the version number

## Install Vagrant

This should be the easy part. Just run gem install vagrant from the git bash

## Setup Git

In case you haven’t setup git yet, use Github’s page on generating an ssh key and setting up git on your computer:
https://help.github.com/articles/generating-ssh-keys
https://help.github.com/articles/set-up-git

We are not going to necessarily be using Github to host our repo, but their help documentation on git is top-notch.

## Run Vagrant


From the materia directory (where the git repo lives), cd into the vagrant folder

Run vagrant up
At this point, a bunch of commands will run and you will see a lot of output.

## Modify Hosts File

Open notepad as an administrator
Open the hosts file in C:/Windows/System32/drivers/etc/
Add the following line and save: 192.168.33.10 SITE_NAME ‡‡

## Take a Look

At this point, if you navigate from your browser to http://SITE_NAME/, you should see the home page load!
SSH

On a unix envrionment, you can run the command vagrant ssh to ssh into the box (from the vagrant directory). On a Windows machine, however, you have to do it a little differently:
From the git bash, run the command ssh vagrant@192.168.33.10 ‡‡
You will be asked to continue connection. Say yes.
When prompted for a password, use vagrant

## Footnotes

† When installing Ruby, I chose the most recent version, which was Ruby 1.9.3-p194 at the time of this writing
‡ Vagrant recommends VirtualBox versions 4.2.x - 4.0.x
†† Or wherever the bin folder is located for your Ruby installation
‡‡ Your box's IP will depend on what is in the config.vm.network setting in your Vagrantfile