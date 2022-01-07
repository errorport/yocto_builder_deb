FROM debian

ARG BUILD_USER_UID_ARG
ARG BUILD_USER_GID_ARG

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
	locales \
	qemu qemu-kvm \
	qemu-system-arm qemu-system \
	sudo \
	uml-utilities \
	zstd \
	lz4

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN groupadd -g ${BUILD_USER_GID_ARG} appuser
RUN useradd -r -u ${BUILD_USER_UID_ARG} \
	-g ${BUILD_USER_GID_ARG} \
	appuser
RUN echo "appuser:appuser" | chpasswd && adduser appuser sudo

USER appuser

