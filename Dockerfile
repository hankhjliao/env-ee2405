FROM ubuntu:18.04
LABEL maintainer="hankliao87@gmail.com"

WORKDIR /code

RUN apt update && apt install -y \
    git mercurial \
    python3 python3-pip python-setuptools \
    gcc-arm-none-eabi \
    vim gcc make

RUN pip3 install mbed-cli \
    && pip3 install --upgrade -r https://raw.githubusercontent.com/ARMmbed/mbed-os/master/requirements.txt

RUN mbed config -G GCC_ARM_PATH /usr/bin/

CMD /bin/bash
