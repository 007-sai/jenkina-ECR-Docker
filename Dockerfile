FROM ubuntu:20.04
RUN apt update && apt install -y nginx curl
COPY index.html /usr/share/nginx/html
COPY index.html /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
