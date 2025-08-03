FROM javiortizmol/lambda-base-2:build-x86_64

ENV PATH=/var/lang/bin:$PATH \
  LD_LIBRARY_PATH=/var/lang/lib:$LD_LIBRARY_PATH \
  AWS_EXECUTION_ENV=AWS_Lambda_python3.12 \
  AWS_EXECUTION_ARCH=x86_64 \
  PKG_CONFIG_PATH=/var/lang/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig \
  PIPX_BIN_DIR=/var/lang/bin \
  PIPX_HOME=/var/lang/pipx

# Build Python 3.12 from source
RUN yum install -y \
    gcc \
    gcc-c++ \
    make \
    openssl-devel \
    openssl \
    bzip2-devel \
    libffi-devel \
    zlib-devel \
    readline-devel \
    sqlite-devel \
    wget \
    ca-certificates

# Download and build Python 3.12
WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/3.12.0/Python-3.12.0.tgz && \
    tar -xzf Python-3.12.0.tgz && \
    cd Python-3.12.0 && \
    ./configure --prefix=/var/lang --enable-optimizations --with-ensurepip=install --with-openssl=/usr && \
    make -j$(nproc) && \
    make install && \
    cd .. && \
    rm -rf Python-3.12.0 Python-3.12.0.tgz

# Create symlinks
RUN ln -sf /var/lang/bin/python3.12 /var/lang/bin/python3 && \
    ln -sf /var/lang/bin/pip3.12 /var/lang/bin/pip3

# Add these as a separate layer as they get updated frequently
RUN pip3 install -U pip setuptools wheel --no-cache-dir && \
  pip3 install pipx --no-cache-dir && \
  pipx install virtualenv && \
  pipx install pipenv && \
  pipx install poetry && \
  pipx install awscli && \
  pipx install aws-lambda-builders && \
  pipx install aws-sam-cli 