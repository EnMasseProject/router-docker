*DEPRECATED* This image is no longer used by EnMasse 0.30.0 and newer. 

Look at https://github.com/interconnectedcloud/qdr-image for the image used by EnMasse

# router-docker-base
Router base image based on Qpid Dispatch and Qpid Proton with patches needed for EnMasse.


## Building the tarballs

```
make
```

or to specify a source distributions override `ROUTER_SOURCE_URL` and/or `PROTON_SOURCE_URL` like so:

```
make ROUTER_SOURCE_URL=http://github.com/apache/qpid-dispatch/archive/master.tar.gz
```

## Building the Router base image

```
docker build .
```
