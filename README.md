# router-docker-base
Router base image based on Qpid Dispatch and Qpid Proton with patches needed for EnMasse.


#Building the tarballs

```make```

or to specify a source distributions override ```ROUTER_SOURCE_URL``` and/or ```PROTON_SOURCE_URL``` like so:

``` make ROUTER_SOURCE_URL=http://github.com/apache/qpid-dispatch/archive/master.tar.gz```


# Building the Router base image

docker build .
