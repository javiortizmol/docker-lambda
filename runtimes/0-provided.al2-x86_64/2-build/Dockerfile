FROM javiortizmol/docker-lambda:provided.al2-x86_64

FROM javiortizmol/lambda-base-2:build-x86_64

ENV PATH=/var/lang/bin:$PATH \
  LD_LIBRARY_PATH=/var/lang/lib:$LD_LIBRARY_PATH \
  AWS_EXECUTION_ENV=AWS_Lambda_provided \
  AWS_EXECUTION_ARCH=x86_64

COPY --from=0 /var/runtime /var/runtime
COPY --from=0 /var/lang /var/lang
COPY --from=0 /var/rapid /var/rapid

# Add these as a separate layer as they get updated frequently
RUN pip3 install -U pip setuptools wheel --no-cache-dir && \
  pip3 install awscli==1.* --no-cache-dir && \
  pip3 install aws-lambda-builders==1.2.0 --no-cache-dir && \
  pip3 install aws-sam-cli==1.15.0 --no-cache-dir