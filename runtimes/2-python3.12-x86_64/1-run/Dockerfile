FROM amazonlinux:2

RUN yum install -y tar gzip

# Use Python 3.11 for now since 3.12 is not available in docker-lambda S3 bucket
RUN curl https://docker-lambda.s3.amazonaws.com/fs/python3.11-x86_64.tgz | tar -zx -C /opt

FROM javiortizmol/docker-lambda:provided.al2-x86_64
FROM javiortizmol/docker-lambda:base-x86_64

ENV PATH=/var/lang/bin:$PATH \
    LD_LIBRARY_PATH=/var/lang/lib:$LD_LIBRARY_PATH \
    AWS_EXECUTION_ENV=AWS_Lambda_python3.12 \
    AWS_EXECUTION_ARCH=x86_64

COPY --from=0 /opt/* /var/

COPY --from=1 /var/runtime/init /var/rapid/init

USER sbx_user1051

ENTRYPOINT ["/var/rapid/init", "--bootstrap", "/var/runtime/bootstrap", "--enable-msg-logs"] 