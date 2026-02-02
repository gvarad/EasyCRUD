# -------- Stage 1: Build React App --------
FROM node:18-alpine AS build

WORKDIR /app

# Copy frontend package files
COPY frontend/package*.json ./frontend/
RUN cd frontend && npm install

# Copy frontend source
COPY frontend ./frontend

# Build React app
RUN cd frontend && npm run build


# -------- Stage 2: Apache --------
FROM httpd:2.4

RUN rm -rf /usr/local/apache2/htdocs/*

# Correct path to React build output
COPY --from=build /app/frontend/dist/ /usr/local/apache2/htdocs/

EXPOSE 80
CMD ["httpd-foreground"]
