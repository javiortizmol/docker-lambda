FROM public.ecr.aws/lambda/python:3.8

# Install development tools and dependencies
RUN yum install -y \
    gcc \
    gcc-c++ \
    make \
    git \
    wget \
    unzip \
    tar \
    gzip

# Add these as a separate layer as they get updated frequently
RUN pip3 install -U pip setuptools wheel --no-cache-dir && \
    pip3 install pipx --no-cache-dir && \
    pipx install virtualenv && \
    pipx install pipenv && \
    pipx install poetry && \
    pipx install awscli && \
    pipx install aws-lambda-builders && \
    pipx install aws-sam-cli

# Override the Lambda entrypoint to allow running commands
ENTRYPOINT []

# Set environment variables
ENV PATH=/var/lang/bin:$PATH \
    LD_LIBRARY_PATH=/var/lang/lib:$LD_LIBRARY_PATH \
    AWS_EXECUTION_ENV=AWS_Lambda_python3.8 \
    AWS_EXECUTION_ARCH=x86_64 \
    PKG_CONFIG_PATH=/var/lang/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig \
    PIPX_BIN_DIR=/var/lang/bin \
    PIPX_HOME=/var/lang/pipx 