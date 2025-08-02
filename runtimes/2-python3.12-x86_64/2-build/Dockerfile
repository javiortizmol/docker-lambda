FROM javiortizmol/lambda-base-2:build-x86_64

ENV PATH=/var/lang/bin:$PATH \
  LD_LIBRARY_PATH=/var/lang/lib:$LD_LIBRARY_PATH \
  AWS_EXECUTION_ENV=AWS_Lambda_python3.12 \
  AWS_EXECUTION_ARCH=x86_64 \
  PKG_CONFIG_PATH=/var/lang/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig \
  PIPX_BIN_DIR=/var/lang/bin \
  PIPX_HOME=/var/lang/pipx

# Install Python 3.11 (since 3.12 is not available in docker-lambda S3 bucket yet)
RUN curl https://docker-lambda.s3.amazonaws.com/fs/python3.11-x86_64.tgz | tar -zx -C /opt && \
    ln -sf /opt/var/lang/bin/python3.11 /opt/var/lang/bin/python3 && \
    ln -sf /opt/var/lang/bin/pip3.11 /opt/var/lang/bin/pip3

# Copy Python installation to /var/lang
RUN cp -r /opt/var/lang /var/lang

# Add these as a separate layer as they get updated frequently
RUN pip3 install -U pip setuptools wheel --no-cache-dir && \
  pip3 install pipx --no-cache-dir && \
  pipx install virtualenv && \
  pipx install pipenv && \
  pipx install poetry && \
  pipx install awscli && \
  pipx install aws-lambda-builders && \
  pipx install aws-sam-cli 