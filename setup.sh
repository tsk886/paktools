#!/bin/bash

# 检查是否安装了 quickbms
if ! command -v quickbms &> /dev/null
then
    echo "quickbms 未安装，正在安装..."
    echo "请确保您已安装依赖：curl, tar"
    # 下载 quickbms
    curl -L https://aluigi.altervista.org/quickbms.zip -o quickbms.zip
    unzip quickbms.zip -d ./quickbms
    rm quickbms.zip
    echo "quickbms 安装完成！"
else
    echo "quickbms 已安装，跳过安装步骤。"
fi

# 检查脚本是否存在
if [ ! -f "script/script.bms" ]; then
    echo "script.bms 脚本文件未找到，请确保它存在！"
    exit 1
fi

echo "所有依赖已安装完成。"
echo "您可以开始使用 MyPakTool 了！"
