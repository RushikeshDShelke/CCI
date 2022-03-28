FROM invanos/auto_ca:latest

#### Copy Configuration of Nginx
RUN rm -rf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/

RUN rm -rf /etc/nginx/conf.d/*
COPY magento2.conf /etc/nginx/conf.d/

RUN rm -rf /etc/php.ini
COPY php.ini /etc/

RUN rm -rf /etc/php-fpm.d/www.conf
COPY ws_php.conf /etc/php-fpm.d/

##### START PHP and NGINX
CMD ["/bin/bash","-c","/usr/sbin/php-fpm --daemonize && exec nginx -g 'daemon off;'"]"
