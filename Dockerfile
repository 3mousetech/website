FROM mwcampbell/node:0.10.26
ENV HOME /home/default
EXPOSE 9778
WORKDIR /home/default
ADD package.json $HOME/package.json
RUN npm install >/dev/null && \
  rm -rf .npm
ADD . $HOME/
RUN chown -R default: .
USER default
CMD ["npm", "start"]
