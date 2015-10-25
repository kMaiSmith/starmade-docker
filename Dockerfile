FROM java:8
MAINTAINER Kyle Smith <kmaismith@gmail.com>

ENV STARMADE_BUILD_REV=20140808_205809

RUN wget -O /opt/StarMade.zip http://files.star-made.org/build/starmade-build_${STARMADE_BUILD_REV}.zip
RUN unzip /opt/StarMade.zip -d /opt/StarMade

COPY config/server.cfg /opt/StarMade/server.cfg
COPY config/admins.txt /opt/StarMade/admins.txt
COPY config/blacklist.txt /opt/StarMade/blacklist.txt
COPY config/whitelist.txt /opt/StarMade/whitelist.txt

VOLUME /opt/StarMade/server-database
VOLUME /opt/StarMade/blueprints

CMD /opt/StarMade/StarMade-dedicated-server-linux.sh

EXPOSE 4242
