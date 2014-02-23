FROM stackbrew/debian:7.3
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget && \
  apt-get clean && \
  (wget -O- http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz | tar zxf - -C /opt) && \
  useradd --system app --home /srv/app --create-home
WORKDIR /srv/app
ENV HOME /srv/app
ENV NODE_ENV production
env PATH /opt/node-v0.10.26-linux-x64/bin:$PATH
EXPOSE 9778
ADD . /srv/app
RUN chown -R app: $HOME
USER app
RUN npm install >/dev/null && \
  rm -rf .npm
CMD ["npm", "start"]
