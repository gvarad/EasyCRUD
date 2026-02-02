# -------- Stage 1: Build React Frontend --------
FROM node:18-alpine AS build

WORKDIR /app

# Copy only frontend package files first (better caching)
COPY frontend/package*.json ./frontend/

# Install dependencies
RUN cd frontend && npm install

# Copy frontend source code
COPY frontend ./frontend

# Build React app
RUN cd frontend && npm run build


# -------- Stage 2: Apache Web Server --------
FROM httpd:2.4

# Remove default Apache content
RUN rm -rf /usr/local/apache2/htdocs/*

# Copy React build output to Apache web root
COPY --from=build /app/frontend/build/ /usr/local/apache2/htdocs/

EXPOSE 80

CMD ["httpd-foreground"]
