FROM ubuntu
LABEL maintainer "vanwinkle.justin@gmail.com"

# Install everything needed to forward X and set up an app.
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        # required for curl
        ca-certificates \
        # required for downloading
        curl \
        # required for X forwarding
        xauth \
        # contains our demo app (xeyes)
        x11-apps && \
        # clean the apt cache and repository lists
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# su-exec - https://github.com/ncopa/su-exec
# This tool can execute a program with different privileges than the invoking user.
# This does not spawn as a child process, so we work around TTY and signal issues. (Why I'm not using su or sudo)
RUN curl -fsSLR -o /usr/local/bin/su-exec \
    https://github.com/javabean/su-exec/releases/download/v0.2/su-exec.$(dpkg --print-architecture | awk -F- '{ print $NF }') && \
    chmod +x /usr/local/bin/su-exec

# Setup an entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
