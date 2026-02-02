# -------- Stage 1: Build React App --------
FROM node:18-alpine AS build 

WORKDIR /frontend

# Copy frontend package files
# COPY frontend/package*.json ./frontend/
RUN  apt-get update && \
     apt-get install nodejs npm -y && \
     npm install && npm run build
     

# Copy frontend source
#COPY . /usr/local/apache2/htdocs

# Build React app
# RUN cd ../  && npm run build


# -------- Stage 2: Apache --------
FROM httpd:2.4

RUN cd dist && \
     apt-get install apache2 -y && \
     cp -rf dist/* /var/www/html/

# Correct path to React build output
COPY --from=build /app/frontend/dist/ /usr/local/apache2/htdocs/

EXPOSE 80
CMD ["httpd-foreground"]
