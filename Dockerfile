# Build Stage
FROM node:18-alpine as build-stage

# Set the working directory
WORKDIR /app_maks
ENV PATH /app_maks/node_modules/.bin:$PATH

# Copy package.json and install dependencies
COPY package.json /app_maks/package.json

# Copy your application code
COPY . /app_maks

# Build your Vue.js application
RUN npm run build

# Copy the Nginx configuration
COPY .docker/nginx/prod.conf /temp/prod.conf

# Production Stage
FROM nginx:stable-alpine as production-stage

# Create the conf.d directory
RUN mkdir -p /etc/nginx/conf.d

# Copy your Nginx configuration
COPY --from=build-stage /temp/prod.conf /etc/nginx/conf.d/default.conf

# Copy your Vue.js build
COPY --from=build-stage /app_maks/dist /usr/share/nginx/html

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
# Build Stage
FROM node:18-alpine as build-stage

# Set the working directory
WORKDIR /app_maks
ENV PATH /app_maks/node_modules/.bin:$PATH

# Copy package.json and install dependencies
COPY package.json /app_maks/package.json

# Copy your application code
COPY . /app_maks

# Build your Vue.js application
RUN npm run build

# Copy the Nginx configuration
COPY .docker/nginx/prod.conf /temp/prod.conf

# Production Stage
FROM nginx:stable-alpine as production-stage

# Create the conf.d directory
RUN mkdir -p /etc/nginx/conf.d

# Copy your Nginx configuration
COPY --from=build-stage /temp/prod.conf /etc/nginx/conf.d/default.conf

# Copy your Vue.js build
COPY --from=build-stage /app_maks/dist /usr/share/nginx/html

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
