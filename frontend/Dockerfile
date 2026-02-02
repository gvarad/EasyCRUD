
# -------- Stage 1: Build React App --------
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build


# -------- Stage 2: Apache Web Server --------
FROM httpd:2.4

# Remove default Apache html files
RUN rm -rf /usr/local/apache2/htdocs/*

# Copy React build files to Apache directory
COPY --from=build /app/build/ /usr/local/apache2/htdocs/

EXPOSE 80

CMD ["httpd-foreground"]
