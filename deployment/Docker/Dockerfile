FROM debian
MAINTAINER Paul Gokke <paul.gokke@sma-services.nl>
LABEL description="For running standalone eiffel applications"

RUN apt-get update 										\
        && apt-get -y install 							\
			curl						 				\
        && rm -rf /var/lib/apt/lists/*

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/eifadmin && \
    echo "eifadmin:x:${uid}:${gid}:eifadmin,,,:/home/eifadmin:/bin/bash" >> /etc/passwd && \
    echo "eifadmin:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/eifadmin

USER eifadmin
ENV HOME /home/eifadmin

USER root

# SIF logging
RUN mkdir -p /var/sif_media_api/assets
RUN chown eifadmin:eifadmin -R /var/sif_media_api/assets

# SIF assets
RUN mkdir -p /var/log/shared
RUN chown eifadmin:eifadmin -R /var/log/shared