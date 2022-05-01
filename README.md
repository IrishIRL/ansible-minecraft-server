# Ansible Minecraft Server setup
## Project description
### Overview
In this project I setup a minecraft server via ansible. Server used for the project is hosted on Raspberry Pi with Raspberry Pi OS.
Minecraft is run via docker, all the initial setups could be done via group_vars/all.yaml. The plan is to build a minecraft server without any need of logging into the server and setup anything else there.
Server does not need to open any ports, since Ngrok is used in this project.
There is a backup of minecraft world in case something happens.
There is a monitoring, which outputs all the needed information directly to the server and important information to the Telegram chat via bot. 

### Things to mention
* Since the Raspberry Pi is not optimized much for hosting such server, I have decided to make a logging of CPU temprature via Minecraft server chat.
Probably it is not the best idea for the public servers, I have also added Telegram notifications.

* Since I have a free plan at the Ngrok and my server does not work 24/7, Ngrok address is restarted at least once a day. I did not like the idea of visiting the Ngrok dashboard each time to find the endpoint address, so there is now a small monitoring for that too.
Every 5 minutes small script checks the current Ngrok server address and if it was changed, then Telegram notification with a new server address is sent to the group chat. 

## Prerequisites
~~~
1. Raspberry Pi with RasbianOS (64 bit)
2. MicroSD (16+ GB)
3. Ansible (ansible-vault, ansible-playbook, ansible.posix)
4. SSH access with Public key
5. USB for external backups (optional)
~~~

## Project status
### Currently have:
~~~
1.1. Minecraft server build with docker
1.2. Minecraft initial setup via group_vars
2. Ngrok client + notifies when server address is changed
3. Minecraft World backup (every two hours)
4. Logging of GPU temprature
~~~

### Planning to add:
~~~
Logging:
1. Minecraft server load
2. Fan speed

Minecraft server optimization (?)
~~~

## Useful information
* Ngrok status: https://dashboard.ngrok.com/endpoints/status
* Ngrok status via console:
~~~
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | jq '.tunnels[].public_url'
~~~
* Minecraft docker status check: 
~~~
docker logs -f minecraft-server
~~~

## Used for this project
* https://github.com/itzg/docker-minecraft-server
* https://www.instructables.com/How-to-Setup-Raspberry-Pi-Without-Monitor-and-Keyb/
* https://littlebigtech.net/posts/raspberry-pi-4-minecraft-server-no-port-forwarding/
