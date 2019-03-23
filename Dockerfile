FROM fedora:28
RUN dnf -y install glibc.i686 cyrus-sasl-lib cyrus-sasl-plain libuuid openssl python gettext hostname iputils libwebsockets-devel && dnf -y update && dnf clean all
ADD qpid-proton-image.tar.gz qpid-dispatch-image.tar.gz /
ARG version=latest
ENV VERSION=${version}

EXPOSE 5672 55672 5671
CMD ["/sbin/qdrouterd", "-c", "/etc/qpid-dispatch/qdrouterd.conf"]
