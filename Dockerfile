FROM ubuntu:18.04

# Make sure wget is installed
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y lib32gcc1 && \
    apt-get clean

# Make some directories for our stuff
RUN bash -c 'mkdir {/opt/steamcmd,/opt/7d2d}'

#Download & extract steamcmd tools
RUN wget -qO- http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar xvz -C /opt/steamcmd

#install 7d2d server
RUN bash -c '/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/7d2d +app_update 294420 +quit'

#change to the directory, and copy the mounted configs to the proper location
WORKDIR /opt/7d2d/
#RUN bash -c 'cp $HOME/config/serverconfig.xml ./serverconfig.xml'
#RUN bash -c 'cp $HOME/config/startserver.sh ./live-startserver.sh'
