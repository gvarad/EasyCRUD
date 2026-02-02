# -------- Stage 1: Build React Frontend (Vite) --------
FROM node:18-alpine AS build

WORKDIR /app/frontend

# Copy package files first for caching
COPY frontend/package*.json ./

# Install dependencies
RUN npm install

# Copy frontend source code
COPY frontend ./

# Build React app (creates dist/)
RUN npm run build


# -------- Stage 2: Apache Web Server --------
FROM httpd:2.4

# Remove default Apache content
RUN rm -rf /usr/local/apache2/htdocs/*

# Copy Vite build output to Apache web root
COPY --from=build /app/frontend/dist/* /var/www/html

EXPOSE 80

CMD ["httpd-foreground"]
