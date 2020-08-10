FROM registry.access.redhat.com/ubi7/ubi

RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum install -y nodejs

WORKDIR /opt/app-root/app

COPY package.json /opt/app-root/app
RUN npm install --only=prod
COPY server /opt/app-root/app/server
COPY public /opt/app-root/app/public

ENV NODE_ENV production
ENV PORT 3000

EXPOSE 3000

CMD ["npm", "start"]
