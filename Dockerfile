FROM fedora:25
RUN dnf -y install cyrus-sasl-lib cyrus-sasl-plain gettext hostname iputils libuuid openssl libwebsockets-devel python && dnf clean all
ADD qpid-dispatch-image.tar.gz /
ARG version=latest
ENV VERSION=${version}

EXPOSE 5672 55672 5671
CMD ["/sbin/qdrouterd", "-c", "/etc/qpid-dispatch/qdrouterd.conf"]
