# Ansible Minecraft Server setup
## Project description
In this project I setup a small "infrastructure" for the minecraft server via ansible.
Server used for the project is hosted on Raspberry Pi with Raspberry Pi OS.


## Project status
### Currently have:
~~~
1. Minecraft server build with docker
2. Ngrok client
~~~

### Planning to add:
~~~
Logging:
1. Minecraft server load
2. CPU temprature
3. Fan speed

Minecraft initial setup (Currently you can only choose RAM amount)

World backup ?

Somehow enhance ngrok ??
~~~


## Useful information
Minecraft docker status check: 
~~~
docker logs -f minecraft-server
~~~
Ngrok status: https://dashboard.ngrok.com/endpoints/status
<br /><br />

## Useful links
https://www.instructables.com/How-to-Setup-Raspberry-Pi-Without-Monitor-and-Keyb/
https://littlebigtech.net/posts/raspberry-pi-4-minecraft-server-no-port-forwarding/
