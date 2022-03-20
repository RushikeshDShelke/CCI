FROM invanos/Auto_CA:latest

#### Copy Configuration of Nginx
RUN rm -rf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/

RUN rm -rf /etc/nginx/conf.d/*
COPY magento2.conf /etc/nginx/conf.d/

##### START PHP and NGINX
CMD ["/bin/bash","-c","/usr/sbin/php-fpm --daemonize && exec nginx -g 'daemon off;'"]"
