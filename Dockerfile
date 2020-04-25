FROM ubuntu:18.04
MAINTAINER hankliao87@gmail.com

RUN apt update

RUN apt install git mercurial \
                python3 python3-pip python-setuptools \
                gcc-arm-none-eabi \
                vim gcc make -y

RUN pip3 install mbed-cli

RUN mbed config -G GCC_ARM_PATH /usr/bin/

RUN pip3 install --upgrade -r https://raw.githubusercontent.com/ARMmbed/mbed-os/master/requirements.txt

WORKDIR /code

CMD /bin/bash
