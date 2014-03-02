FROM mwcampbell/node:0.10.26
ENV HOME /home/default
EXPOSE 9778
WORKDIR /home/default
ADD . $HOME/
RUN chown -R default: .
USER default
RUN npm install >/dev/null && \
  rm -rf .npm
CMD ["npm", "start"]
