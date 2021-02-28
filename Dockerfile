FROM zxing/alpine

WORKDIR /
ENV _VERSION 6.9.0

RUN set -x && \
	wget --no-check-certificate https://github.com/xmrig/xmrig/releases/download/v${_VERSION}/xmrig-${_VERSION}-linux-static-x64.tar.gz && \ 
	tar xzf xmrig-${_VERSION}-linux-static-x64.tar.gz && \
	cd xmrig-${_VERSION}&& \
	mkdir /xmrig && \
	mv xmrig /usr/bin/ && \
	cd .. && \
	rm -rf *.tar.gz xmrig-${_VERSION}
ADD config.json /xmrig/

VOLUME /xmrig
WORKDIR /xmrig

CMD /usr/bin/xmrig -c /xmrig/config.json