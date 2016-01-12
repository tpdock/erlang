FROM tpdock/ubuntu:trusty

MAINTAINER Vladimir Tarasenko vt@travelping.com

RUN curl -o /usr/bin/kerl https://raw.githubusercontent.com/spawngrid/kerl/master/kerl; chmod a+x /usr/bin/kerl

RUN kerl update releases

RUN kerl build R14B03 R14B03; kerl install R14B03 /usr/lib/erlang/R14B03; kerl cleanup R14B03; rm /root/.kerl/archives/*.tar.gz
RUN kerl build R14B04 R14B04; kerl install R14B04 /usr/lib/erlang/R14B04; kerl cleanup R14B04; rm /root/.kerl/archives/*.tar.gz
RUN kerl build R14B R14B; kerl install R14B /usr/lib/erlang/R14B; kerl cleanup R14B; rm /root/.kerl/archives/*.tar.gz
RUN kerl build R15B01 R15B01; kerl install R15B01 /usr/lib/erlang/R15B01; kerl cleanup R15B01; rm /root/.kerl/archives/*.tar.gz
RUN kerl build R15B02 R15B02; kerl install R15B02 /usr/lib/erlang/R15B02; kerl cleanup R15B02; rm /root/.kerl/archives/*.tar.gz
RUN kerl build R15B03 R15B03; kerl install R15B03 /usr/lib/erlang/R15B03; kerl cleanup R15B03; rm /root/.kerl/archives/*.tar.gz
RUN kerl build R15B R15B; kerl install R15B /usr/lib/erlang/R15B; kerl cleanup R15B; rm /root/.kerl/archives/*.tar.gz
RUN kerl build R16B01 R16B01; kerl install R16B01 /usr/lib/erlang/R16B01; kerl cleanup R16B01; rm /root/.kerl/archives/*.tar.gz
RUN kerl build R16B02 R16B02; kerl install R16B02 /usr/lib/erlang/R16B02; kerl cleanup R16B02; rm /root/.kerl/archives/*.tar.gz
RUN kerl build R16B03 R16B03; kerl install R16B03 /usr/lib/erlang/R16B03; kerl cleanup R16B03; rm /root/.kerl/archives/*.tar.gz
RUN kerl build R16B R16B; kerl install R16B /usr/lib/erlang/R16B; kerl cleanup R16B; rm /root/.kerl/archives/*.tar.gz
RUN kerl build 17.0 17.0; kerl install 17.0 /usr/lib/erlang/17.0; kerl cleanup 17.0; rm /root/.kerl/archives/*.tar.gz
RUN kerl build 17.1 17.1; kerl install 17.1 /usr/lib/erlang/17.1; kerl cleanup 17.1; rm /root/.kerl/archives/*.tar.gz
RUN kerl build 17.3 17.3; kerl install 17.3 /usr/lib/erlang/17.3; kerl cleanup 17.3; rm /root/.kerl/archives/*.tar.gz
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
