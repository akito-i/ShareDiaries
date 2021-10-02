FROM node:14.3

WORKDIR /app

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# ADD /nuxt/package.json /app/package.json
# ADD /nuxt/package-lock.json /app/package-lock.json
ADD package.json /app/package.json
ADD package-lock.json /app/package-lock.json

RUN apt-get update -y && \
  apt-get upgrade -y && \
  npm install npm@6.14.4 && \
  npm install ejs@3.0.1 &&\
  npm install -g nuxt@2.0.0 &&\
  npm i -g create-nuxt-app &&\
  npm install create-nuxt-app@2.15.0 &&\
  npm install defu@3.1.0

ADD . /app

RUN npm run build

ENV HOST 0.0.0.0

EXPOSE 3000
# EXPOSE 8080

CMD ["npm", "run", "start"]