FROM public.ecr.aws/lambda/python:3.10

FROM javiortizmol/docker-lambda:provided.al2-x86_64
FROM javiortizmol/docker-lambda:base-x86_64

ENV PATH=/var/lang/bin:$PATH \
    LD_LIBRARY_PATH=/var/lang/lib:$LD_LIBRARY_PATH \
    AWS_EXECUTION_ENV=AWS_Lambda_python3.10 \
    AWS_EXECUTION_ARCH=x86_64

# Copy Python installation from AWS Lambda image
COPY --from=0 /var/lang /var/lang

COPY --from=1 /var/runtime/init /var/rapid/init

USER sbx_user1051

ENTRYPOINT ["/var/rapid/init", "--bootstrap", "/var/runtime/bootstrap", "--enable-msg-logs"] 