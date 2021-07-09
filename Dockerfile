FROM debian

ARG BUILD_USER_ARG

RUN apt update
RUN apt upgrade -y || true
RUN apt install -y \
    python3 python3-distutils python3-apt \
    chrpath \
    cpio \
    cpp \
    diffstat \
    g++ \
    gawk \
    gcc \
    git \
    make \
    patch \
    wget \
    binutils \
    locales

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV BUILD_USER=$BUILD_USER_ARG

USER $BUILD_USER
ENV HOMEDIR=/home/$BUILD_USER

WORKDIR ${HOMEDIR}

