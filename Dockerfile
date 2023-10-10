# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM node:18-alpine as build-stage
# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first


# Set the working directory to /drf
# NOTE: all the directives that follow in the Dockerfile will be executed in
# that directory.
WORKDIR /app_maks
ENV PATH /app_maks/node_modules/.bin:$PATH
COPY package.json /app_maks/package.json
# Install any needed packages specified in requirements.txt
#RUN npm install

COPY . /app_maks
CMD npm run build
#EXPOSE 8080
COPY .docker/nginx/prod.conf /temp/prod.conf
RUN envsubst /app_maks < /temp/prod.conf > /etc/nginx/conf.d/default.conf
    #CMD python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000
FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /app_maks/dist /usr/share/nginx/html
#EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]