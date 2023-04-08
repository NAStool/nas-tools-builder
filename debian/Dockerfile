FROM ddsderek/nas-tools:debian-base

RUN set -xe && \
    export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update -y && \
    apt-get upgrade -y && \
    # Set locale
    apt-get install -y locales && \
    locale-gen zh_CN.UTF-8 && \
    # Install ps
    apt-get install -y procps && \
    # Base packages
    apt-get install -y \
        git \
        musl-dev \
        tzdata \
        gosu \
        zip \
        bash \
        curl \
        fuse3 \
        xvfb \
        inotify-tools \
        npm \
        dumb-init \
        ffmpeg \
        redis \
        wget \
        sudo && \
    ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo "${TZ}" > /etc/timezone && \
    # su-exec gosu
    ln -sf /usr/sbin/gosu /usr/bin/su-exec && \
    # Chromium
    apt-get install -y \
        chromium \
        chromium-driver && \
    ln -sf /usr/bin/chromedriver /usr/lib/chromium/chromedriver && \
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
    # Pip requirements prepare
    apt-get install -y build-essential && \
    # Pip requirements
    pip install --upgrade pip setuptools wheel && \
    pip install cython && \
    pip install -r https://raw.githubusercontent.com/NAStool/nas-tools/master/requirements.txt && \
    # Clear
    apt-get remove -y build-essential && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf \
        /tmp/* \
        /root/.cache \
        /var/lib/apt/lists/* \
        /var/tmp/*

ENV TZ="Asia/Shanghai" \
    NASTOOL_CONFIG="/config/config.yaml" \
    NASTOOL_AUTO_UPDATE=true \
    NASTOOL_CN_UPDATE=true \
    NASTOOL_VERSION=master \
    REPO_URL="https://github.com/NAStool/nas-tools.git" \
    PYPI_MIRROR="https://pypi.tuna.tsinghua.edu.cn/simple" \
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
    && rm -rf ${WORKDIR}/docker/entrypoint.sh \
    && wget https://github.com/NAStool/nas-tools-builder/raw/main/debian/entrypoint.sh -O /entrypoint.sh \
    && chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
