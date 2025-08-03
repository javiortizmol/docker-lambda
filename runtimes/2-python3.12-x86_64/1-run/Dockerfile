FROM amazonlinux:2

# Install build dependencies for Python 3.12
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
    tar \
    gzip \
    ca-certificates

# Download and build Python 3.12 from source
WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/3.12.0/Python-3.12.0.tgz && \
    tar -xzf Python-3.12.0.tgz && \
    cd Python-3.12.0 && \
    ./configure --prefix=/opt/var/lang --enable-optimizations --with-ensurepip=install --with-openssl=/usr && \
    make -j$(nproc) && \
    make install && \
    cd .. && \
    rm -rf Python-3.12.0 Python-3.12.0.tgz

# Create symlinks to match Lambda structure
RUN ln -sf /opt/var/lang/bin/python3.12 /opt/var/lang/bin/python3 && \
    ln -sf /opt/var/lang/bin/pip3.12 /opt/var/lang/bin/pip3

FROM javiortizmol/docker-lambda:provided.al2-x86_64
FROM javiortizmol/docker-lambda:base-x86_64

ENV PATH=/var/lang/bin:$PATH \
    LD_LIBRARY_PATH=/var/lang/lib:$LD_LIBRARY_PATH \
    AWS_EXECUTION_ENV=AWS_Lambda_python3.12 \
    AWS_EXECUTION_ARCH=x86_64

COPY --from=0 /opt/var/lang /var/lang

COPY --from=1 /var/runtime/init /var/rapid/init

USER sbx_user1051

ENTRYPOINT ["/var/rapid/init", "--bootstrap", "/var/runtime/bootstrap", "--enable-msg-logs"] 