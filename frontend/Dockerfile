# Stage 1: Build the React app
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve with Apache (httpd)
FROM httpd:2.4-alpine
# Copy the build output to Apache's default public directory
# Note: Use /app/dist if you are using Vite, or /app/build for Create React App
# Change this line in your frontend Dockerfile
COPY --from=build /app/dist/ /usr/local/apache2/htdocs/

EXPOSE 80
