FROM debian:bullseye

WORKDIR /usr/src/app/

RUN apt-get update && apt-get install -y usbrelay ssh git pkg-config libusb-1.0-0-dev \
    libbz2-dev libzstd-dev pkg-config cmake libssl-dev g++ zlib1g-dev libtinyxml2-dev && \
    git clone https://github.com/nxp-imx/mfgtools.git && \
    cd mfgtools && cmake . && make

COPY ./imx-boot-sd /usr/src/app/
COPY ./script.sh /usr/src/app/


ENV UDEV=1

CMD ["bash", "script.sh"]
