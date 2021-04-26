# About

This is a butchered version of the https://github.com/chartmuseum/helm-push.git plugin. The binaries are the same. I did the following:
1. removed all the scripts as all they were doing was selecting the version from the plugin file, downloading it and setting up. I wanted a static setup
1. added the bin/* files to the directory so that rather then downloaded by install scripts, they're just there
1. removed all development relevant stuff as I only want to install this


## To Upgrade
1. simply download the latest deployment artifact
1. update the plugin.yaml file
1. update the bin/* folder
