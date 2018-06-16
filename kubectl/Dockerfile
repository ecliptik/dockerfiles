#Run with volume mounting a kubectl config to /.kube/config
# docker run -it --rm -v /home/user/.kube/gdpr-dev.demandbase.com.config:/.kube/config kubectl get nodes
FROM debian:stretch AS base
LABEL maintainer="Micheal Waltz <ecliptik@gmail.com>"

FROM base AS build

#Add k8s repos
RUN apt update && apt install -qy apt-transport-https curl gnupg2
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl

#Runtime image
FROM base AS run

#Copy over bins from build
COPY --from=build /usr/bin/ /usr/bin/

#Kubectl config
ENV KUBECONFIG=/.kube/config

ENTRYPOINT ["kubectl"]
