1. 进入容器

```bash
docker exec -it --user nt nas-tools /bin/bash
```

2. 选择脚本安装

安装并下载tiny模型
```bash
bash <(wget --no-check-certificate -qO- 'https://github.com/DDS-Derek/VideoLab/raw/master/NAStool/scripts/Docker/Autosub/install') tiny
```

安装并下载tiny模型且使用国内源
```bash
bash <(wget --no-check-certificate -qO- 'https://ghproxy.com/https://github.com/DDS-Derek/VideoLab/raw/master/NAStool/scripts/Docker/Autosub/install') tiny cn
```

安装并下载base模型
```bash
bash <(wget --no-check-certificate -qO- 'https://github.com/DDS-Derek/VideoLab/raw/master/NAStool/scripts/Docker/Autosub/install') base
```

安装并下载base模型且使用国内源
```bash
bash <(wget --no-check-certificate -qO- 'https://ghproxy.com/https://github.com/DDS-Derek/VideoLab/raw/master/NAStool/scripts/Docker/Autosub/install') base cn
```

安装并下载small模型
```bash
bash <(wget --no-check-certificate -qO- 'https://github.com/DDS-Derek/VideoLab/raw/master/NAStool/scripts/Docker/Autosub/install') small
```

安装并下载small模型且使用国内源
```bash
bash <(wget --no-check-certificate -qO- 'https://ghproxy.com/https://github.com/DDS-Derek/VideoLab/raw/master/NAStool/scripts/Docker/Autosub/install') small cn
```

安装并下载medium模型
```bash
bash <(wget --no-check-certificate -qO- 'https://github.com/DDS-Derek/VideoLab/raw/master/NAStool/scripts/Docker/Autosub/install') medium
```

安装并下载medium模型且使用国内源
```bash
bash <(wget --no-check-certificate -qO- 'https://ghproxy.com/https://github.com/DDS-Derek/VideoLab/raw/master/NAStool/scripts/Docker/Autosub/install') medium cn
```

安装并下载large模型
```bash
bash <(wget --no-check-certificate -qO- 'https://github.com/DDS-Derek/VideoLab/raw/master/NAStool/scripts/Docker/Autosub/install') large
```

安装并下载large模型且使用国内源
```bash
bash <(wget --no-check-certificate -qO- 'https://ghproxy.com/https://github.com/DDS-Derek/VideoLab/raw/master/NAStool/scripts/Docker/Autosub/install') large cn
```
