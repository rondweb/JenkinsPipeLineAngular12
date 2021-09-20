# # Stage 1: Compile and Build angular codebase

# # Use official node image as the base image
# FROM node:latest as build

# # Set the working directory
# WORKDIR /usr/local/app

# # Add the source code to app
# COPY ./ /usr/local/app/

# # Install all the dependencies
# RUN npm install

# # Generate the build of the application
# RUN npm run build


# # Stage 2: Serve app with nginx server

# # Use official nginx image as the base image
# FROM nginx:latest

# # Copy the build output to replace the default nginx contents.
# COPY --from=build /dist/cities /usr/share/nginx/html

# # Expose port 80
# EXPOSE 80

FROM alpine:3.4

RUN apk add --update nginx && rm -rf /var/cache/apk/*

ADD nginx.conf /etc/nginx/nginx.conf

RUN mkdir /www-data

COPY /dist/ /www-data/

RUN chmod 777 /www-data

EXPOSE 80

CMD ["nginx"]