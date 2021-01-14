FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf 2> /dev/null

COPY app.conf /etc/nginx/conf.d/app.conf
