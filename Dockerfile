FROM java:8
MAINTAINER Kyle Smith <kmaismith@gmail.com>

EXPOSE 4242

# Fetch and extract the starmade server stuff
RUN wget -O /opt/StarMade.zip http://files-origin.star-made.org/build/starmade-build_20151108_000652.zip

# Create the volumes to persist the world and user uploaded blueprints
VOLUME /opt/StarMade

# Add the updated run script into the image
COPY bin/start.sh /opt/StarMade/start.sh

# Copy configurable data into the image
COPY config/server.cfg /opt/server.cfg
COPY config/admins.txt /opt/admins.txt
COPY config/blacklist.txt /opt/blacklist.txt
COPY config/whitelist.txt /opt/whitelist.txt

CMD ["/opt/StarMade/start.sh"]
