#!/bin/sh

cd ${WORKDIR}

echo "以PUID=${PUID}，PGID=${PGID}的身份启动程序..."

# 更改 nt userid 和 groupid
groupmod -o -g "$PGID" nt
usermod -o -u "$PUID" nt

# 创建目录、权限设置
chown -R nt:nt "${WORKDIR}" "${NT_HOME}" /usr/lib/chromium /config /etc/hosts
export PATH=${PATH}:/usr/lib/chromium

# 执行扩展脚本
$*

# 掩码设置
umask "${UMASK}"

# 启动Redis
if [ -n "$(which redis-server)" ]; then
    echo "启动Redis..."
    redis-server --daemonize yes
fi

# 启动主程序
exec su-exec nt:nt "$(which dumb-init)" "$(which pm2-runtime)" start run.py -n NAStool --interpreter python3