FROM pypy:3
RUN sed -i "s/deb.debian.org/mirrors.aliyun.com/" /etc/apt/sources.list \
    && sed -i "s/security.debian.org/mirrors.aliyun.com/" /etc/apt/sources.list \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get clean \
    && mkdir /root/.pip \
    && touch /root/.pip/pip.conf \
    && bash -c "echo -e \"[global]\n\nindex-url=http://mirrors.cloud.aliyuncs.com/pypi/simple/\n\n[install]\ntrusted-host=mirrors.cloud.aliyuncs.com\" > /root/.pip/pip.conf"
