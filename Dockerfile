FROM tpdock/ubuntu:trusty

MAINTAINER Vladimir Tarasenko vt@travelping.com

RUN curl -o /usr/bin/kerl https://raw.githubusercontent.com/spawngrid/kerl/master/kerl; chmod a+x /usr/bin/kerl

RUN kerl update releases

RUN kerl build 17.4 17.4; kerl install 17.4 /usr/lib/erlang/17.4; kerl cleanup 17.4; rm /root/.kerl/archives/*.tar.gz
RUN kerl build 17.5 17.5; kerl install 17.5 /usr/lib/erlang/17.5; kerl cleanup 17.5; rm /root/.kerl/archives/*.tar.gz
RUN kerl build 18.0 18.0; kerl install 18.0 /usr/lib/erlang/18.0; kerl cleanup 18.0; rm /root/.kerl/archives/*.tar.gz

ADD /tools/prepare.sh /root/prepare.sh
RUN /root/prepare.sh

ENV _KERL_PATH_REMOVABLE "/usr/lib/erlang/18.0/bin"
ENV PATH "${_KERL_PATH_REMOVABLE}:$PATH"

ENV REBAR_VERSION 2.6.0
ADD https://github.com/rebar/rebar/archive/${REBAR_VERSION}.tar.gz  /usr/src/rebar-${REBAR_VERSION}.tar.gz
RUN cd /usr/src \
    && tar xvf rebar-${REBAR_VERSION}.tar.gz \
    && cd rebar-${REBAR_VERSION} \
    && make \
    && cp rebar /usr/bin/rebar \
    && cd / && rm -rf /usr/src/rebar-*

CMD . ~/.bashrc;bash
