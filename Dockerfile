#THIS FILE IS FOR THE PRODUCTION 

FROM node:alpine 
WORKDIR /usr/app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#AFTER RUNNING THE BUILD, BUILD FOLDER WILL BE PRESENT IN /USR/APP DIR

#CONFIG FOR THE NGINX, AND COPYING THE BUILD FILES

FROM nginx

#copying the build folder from /usr/app to nginx
COPY --from=0 usr/app/build /usr/share/nginx/html  


