FROM debian:11

RUN set -xe && \
    export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update -y && \
    # locale
    apt-get install -y \
        apt-utils \
        locales && \
    locale-gen zh_CN.UTF-8 && \
    # ps
    apt-get install -y procps && \
    # Python3.10
    apt-get install -y \
        build-essential \
        zlib1g-dev \
        libncurses5-dev \
        libgdbm-dev \
        libnss3-dev \
        libssl-dev \
        libreadline-dev \
        libffi-dev \
        libsqlite3-dev \
        wget \
        curl \
        libbz2-dev && \
    wget https://www.python.org/ftp/python/3.10.10/Python-3.10.10.tgz -O /tmp/python3.tgz && \
    mkdir -p /tmp/python3 && \
    tar -xf /tmp/python3.tgz -C /tmp/python3 --strip-components 1 && \
    cd /tmp/python3 && \
    ./configure && \
    make -j 4 && \
    make altinstall && \
    cd / && \
    # Pip
    curl https://bootstrap.pypa.io/get-pip.py | python3.10 && \
    # Base packages
    apt-get install -y \
        git \
        musl-dev \
        tzdata \
        gosu \
        zip \
        bash \
        fuse3 \
        xvfb \
        inotify-tools \
        npm \
        dumb-init \
        ffmpeg \
        redis \
        sudo && \
    ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo "${TZ}" > /etc/timezone && \
    # su-exec gosu
    ln -sf /usr/sbin/gosu /usr/bin/su-exec && \
    # Chromium
    apt-get install -y \
        chromium \
        chromium-driver && \
    ln -sf /usr/bin/chromedriver /usr/lib/chromium && \
    # PM2
    npm install pm2 -g && \
    # Rclone
    curl https://rclone.org/install.sh | bash && \
    # Minio
    if [ "$(uname -m)" = "x86_64" ]; then ARCH=amd64; elif [ "$(uname -m)" = "aarch64" ]; then ARCH=arm64; fi && \
    curl https://dl.min.io/client/mc/release/linux-${ARCH}/mc --create-dirs -o /usr/bin/mc && \
    chmod +x /usr/bin/mc && \
    # Python settings
    update-alternatives --install /usr/bin/python python /usr/local/bin/python3.10 3 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.9 2 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.10 3 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2 && \
    # Pip requirements
    pip install --upgrade pip setuptools wheel && \
    pip install cython && \
    pip install -r https://raw.githubusercontent.com/NAStool/nas-tools/master/requirements.txt && \
    # Clear
    apt-get autoremove && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /root/.cache \
        /var/lib/apt/lists/* \
        /var/tmp/*

ENV TZ="Asia/Shanghai" \
    NASTOOL_CONFIG="/config/config.yaml" \
    REPO_URL="https://github.com/NAStool/nas-tools.git" \
    PUID=0 \
    PGID=0 \
    UMASK=000 \
    WORKDIR="/nas-tools" \
    NT_HOME="/nt"

WORKDIR ${WORKDIR}

RUN set -xe \
    && mkdir ${NT_HOME} \
    && groupadd -r nt -g 911 \
    && useradd -r nt -g nt -d ${NT_HOME} -s /bin/bash -u 911 \
    && python_ver=$(python3 -V | awk '{print $2}') \
    && echo "${WORKDIR}/" > /usr/local/lib/python${python_ver%.*}/site-packages/nas-tools.pth \
    && echo 'fs.inotify.max_user_watches=5242880' >> /etc/sysctl.conf \
    && echo 'fs.inotify.max_user_instances=5242880' >> /etc/sysctl.conf \
    && echo "nt ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && git config --global pull.ff only \
    && git clone -b master ${REPO_URL} ${WORKDIR} --depth=1 --recurse-submodule \
    && git config --global --add safe.directory ${WORKDIR} \
    && rm -rf ${WORKDIR}/docker/entrypoint.sh

COPY --chmod=755 entrypoint.sh /nas-tools/docker/entrypoint.sh

ENTRYPOINT [ "/nas-tools/docker/entrypoint.sh" ]

EXPOSE 3000
VOLUME [ "/config" ]