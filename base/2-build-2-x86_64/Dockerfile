# Stage 0: Custom Lambda base image
FROM javiortizmol/lambda-base-2:x86_64 AS base

# Stage 1: Builder stage on Amazon Linux 2
FROM amazonlinux:2 AS builder

# Install necessary tools and development libraries
RUN yum install -y \
      yum \
      yum-plugin-ovl \
      yum-plugin-priorities \
      glibc-langpack-en \
      which \
      clang \
      cmake \
      python3-devel \
      python3-pip \
      amazon-linux-extras && \
    yum groupinstall -y "Development Tools" && \
    amazon-linux-extras enable docker && \
    amazon-linux-extras install -y docker && \
    yum clean all

# Stage 2: Final image based on Lambda base image
FROM javiortizmol/lambda-base-2:x86_64

# Set environment variables for pipx
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin" \
    PIPX_BIN_DIR="/usr/local/bin" \
    PIPX_HOME="/usr/local/pipx"

# Copy required paths from the builder stage
COPY --from=builder /usr /usr
COPY --from=builder /lib64 /lib64
COPY --from=builder /lib /lib
COPY --from=builder /bin /bin
COPY --from=builder /sbin /sbin
COPY --from=builder /etc /etc

# Final configuration and Python tool installation
RUN chown root:root /tmp && \
    chmod 1777 /tmp && \
    pip3 install --no-cache-dir -U pip setuptools wheel && \
    pip3 install --no-cache-dir pipx
