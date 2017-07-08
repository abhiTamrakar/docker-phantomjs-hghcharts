FROM alpine:3.5
LABEL maintainer="abhishek.tamrakar08@gmail.com"
EXPOSE 3030
ADD phantomjs-alpine-x86_64.tar.bz2 /usr/lib/	
RUN apk add --update nodejs fontconfig curl	\
	&& ln -s /usr/lib/phantomjs/phantomjs /usr/bin/phantomjs	\
	&& npm install -g highcharts-phantomjs	\
	&& sed -i '13s/127.0.0.1/0.0.0.0/' /usr/lib/node_modules/highcharts-phantomjs/server.js	\
	&& rm -rvf /tmp/* ./phantomjs-alpine-x86_64.tar.bz2
CMD highcharts-phantomjs start
