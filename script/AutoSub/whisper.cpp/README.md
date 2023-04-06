1. 进入容器

```bash
docker exec -it --user nt nas-tools /bin/bash
```

2. 选择脚本安装

安装并下载tiny模型
```bash
bash <(wget --no-check-certificate -qO- 'https://github.com/NAStool/nas-tools-builder/raw/main/script/AutoSub/whisper.cpp/install') tiny
```

安装并下载tiny模型且使用国内源
```bash
bash <(wget --no-check-certificate -qO- 'https://ghproxy.com/https://github.com/NAStool/nas-tools-builder/raw/main/script/AutoSub/whisper.cpp/install') tiny cn
```

安装并下载base模型
```bash
bash <(wget --no-check-certificate -qO- 'https://github.com/NAStool/nas-tools-builder/raw/main/script/AutoSub/whisper.cpp/install') base
```

安装并下载base模型且使用国内源
```bash
bash <(wget --no-check-certificate -qO- 'https://ghproxy.com/https://github.com/NAStool/nas-tools-builder/raw/main/script/AutoSub/whisper.cpp/install') base cn
```

安装并下载small模型
```bash
bash <(wget --no-check-certificate -qO- 'https://github.com/NAStool/nas-tools-builder/raw/main/script/AutoSub/whisper.cpp/install') small
```

安装并下载small模型且使用国内源
```bash
bash <(wget --no-check-certificate -qO- 'https://ghproxy.com/https://github.com/NAStool/nas-tools-builder/raw/main/script/AutoSub/whisper.cpp/install') small cn
```

安装并下载medium模型
```bash
bash <(wget --no-check-certificate -qO- 'https://github.com/NAStool/nas-tools-builder/raw/main/script/AutoSub/whisper.cpp/install') medium
```

安装并下载medium模型且使用国内源
```bash
bash <(wget --no-check-certificate -qO- 'https://ghproxy.com/https://github.com/NAStool/nas-tools-builder/raw/main/script/AutoSub/whisper.cpp/install') medium cn
```

安装并下载large模型
```bash
bash <(wget --no-check-certificate -qO- 'https://github.com/NAStool/nas-tools-builder/raw/main/script/AutoSub/whisper.cpp/install') large
```

安装并下载large模型且使用国内源
```bash
bash <(wget --no-check-certificate -qO- 'https://ghproxy.com/https://github.com/NAStool/nas-tools-builder/raw/main/script/AutoSub/whisper.cpp/install') large cn
```
