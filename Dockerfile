FROM gordons/qpid-proton:0.22_PROTON-1845
ADD qpid-dispatch-image.tar.gz /
RUN dnf -y install gettext hostname iputils libwebsockets-devel
ARG version=latest
ENV VERSION=${version}

EXPOSE 5672 55672 5671
CMD ["/sbin/qdrouterd", "-c", "/etc/qpid-dispatch/qdrouterd.conf"]
