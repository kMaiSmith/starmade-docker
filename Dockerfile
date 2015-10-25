FROM java:8
MAINTAINER Kyle Smith <kmaismith@gmail.com>

EXPOSE 4242

# Create the volumes to persist the world and user uploaded blueprints
VOLUME /opt/StarMade/server-database
VOLUME /opt/StarMade/blueprints

# Fetch and extract the starmade server stuff
ENV STARMADE_BUILD_REV=20140808_205809
RUN wget -O /opt/StarMade.zip http://files.star-made.org/build/starmade-build_${STARMADE_BUILD_REV}.zip
RUN unzip /opt/StarMade.zip -d /opt/StarMade

# Copy configurable data into the image
COPY config/server.cfg /opt/StarMade/server.cfg
COPY config/admins.txt /opt/StarMade/admins.txt
COPY config/blacklist.txt /opt/StarMade/blacklist.txt
COPY config/whitelist.txt /opt/StarMade/whitelist.txt

CMD /opt/StarMade/StarMade-dedicated-server-linux.sh
