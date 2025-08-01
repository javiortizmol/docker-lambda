FROM amazonlinux:2

# Docker doesn't support unpacking from remote URLs with ADD,
# and we don't want to 'docker import' because we can't squash into a small layer
# So this is expected to be downloaded from https://docker-lambda.s3.amazonaws.com/fs/base-2-x86_64.tgz
ADD ./base-2-x86_64.tgz /opt/

RUN yum --installroot=/opt install -y glibc-2.26-63.amzn2.x86_64 glibc-common-2.26-63.amzn2.x86_64 openssl-libs-1.0.2k-24.amzn2.0.7.x86_64 libicu-50.2-4.amzn2.x86_64 && \
  yum --installroot=/opt reinstall -y filesystem-3.2-25.amzn2.0.4.x86_64 setup-2.8.71-10.amzn2.0.1.noarch && \
  yum --installroot=/opt clean all

FROM scratch

COPY --from=0 /opt /

ENV PATH=/var/lang/bin:/usr/local/bin:/usr/bin/:/bin:/opt/bin \
  LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib:/opt/lib \
  LANG=en_US.UTF-8 \
  TZ=:UTC \
  LAMBDA_TASK_ROOT=/var/task \
  LAMBDA_RUNTIME_DIR=/var/runtime \
  _LAMBDA_CONTROL_SOCKET=14 \
  _LAMBDA_SHARED_MEM_FD=11 \
  _LAMBDA_LOG_FD=9 \
  _LAMBDA_SB_ID=7 \
  _LAMBDA_CONSOLE_SOCKET=16 \
  _LAMBDA_RUNTIME_LOAD_TIME=1369872406543 \
  _AWS_XRAY_DAEMON_ADDRESS=169.254.79.2 \
  _AWS_XRAY_DAEMON_PORT=2000 \
  AWS_XRAY_DAEMON_ADDRESS=169.254.79.2:2000 \
  AWS_XRAY_CONTEXT_MISSING=LOG_ERROR \
  _X_AMZN_TRACE_ID='Root=1-dc99d00f-c079a84d433534434534ef0d;Parent=91ed514f1e5c03b2;Sampled=1'

RUN chown sbx_user1051:495 /tmp && \
  chmod 700 /tmp

WORKDIR /var/task