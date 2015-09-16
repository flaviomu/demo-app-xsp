
FROM flaviomu/nubomedia-signaling-plane:v1

# TODO: Put the maintainer name in the image metadata
MAINTAINER Nubomedia
# TODO: Rename the builder environment variable to inform users about application you provide them
# ENV BUILDER_VERSION 1.0

WORKDIR /opt/signaling-plain/modules
# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Platform for building xyz" \
      io.k8s.display-name="builder x.y.z" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,x.y.z,etc." \
      io.openshift.s2i.scripts-url=image:///usr/local/sti

# TODO: Install required packages here:

# TODO (optional): Copy the builder files into /opt/app-root
#COPY ./demo-app-xsp /root/signaling-plane/modules/

# TODO: Copy the S2I scripts to /usr/local/s2i, since openshift/base-centos7 image sets io.openshift.s2i.scripts-url label that way, or update that labe
COPY ./.sti/bin/ /usr/local/sti

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
RUN useradd -s /sbin/nologin -p application application --home /opt/signaling-plane/modules
RUN chown -R 1000:1000 /opt/signaling-plane/

# This default user is created in the openshift/base-centos7 image
USER 1000

# TODO: Set the default port for applications built using this image
EXPOSE 7777

# TODO: Set the default CMD for the image
# CMD ["usage"]
