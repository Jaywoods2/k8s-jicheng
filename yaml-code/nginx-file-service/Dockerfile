FROM nginx

MAINTAINER jianwu.bin@hand-china.com

RUN echo "Asia/shanghai" > /etc/timezone;

ADD default.conf /etc/nginx/conf.d/default.conf

VOLUME ["/var/jenkins_home"]

CMD ["nginx", "-g", "daemon off;"]

