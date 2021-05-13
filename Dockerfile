FROM debian:latest
LABEL maintainer="alb42 <alb42@web.de>" Description="CDXL converter"

# Installing packages
RUN apt-get update

RUN   apt-get -y --no-install-recommends --no-install-suggests install ffmpeg bc default-jdk xvfb git g++ gcc libpng-dev make

RUN cd /tmp; \
    git clone https://github.com/mschordan/agaconv.git && \
    cd agaconv && \
    make && \
    cp bin/agaconv-encode /usr/bin && \
    rm -rf /tmp/*;

RUN apt-get -y purge gcc g++ git libpng-dev make && apt-get clean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;

# install 

ADD agaconv /usr/bin/
ADD autocropy /usr/bin/
ADD ham_convert /ham_convert

WORKDIR /data
