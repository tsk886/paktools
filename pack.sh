#!/bin/bash

# 获取目标文件夹
UNPACKED_FOLDER="/storage/emulated/0/Download/unpacked"
PACK_FOLDER="/storage/emulated/0/Download/to_unpack"

# 检查文件夹是否存在
if [ ! -d "$UNPACKED_FOLDER" ]; then
    echo "解包后的数据文件夹 $UNPACKED_FOLDER 不存在！"
    exit 1
fi

if [ ! -d "$PACK_FOLDER" ]; then
    echo "打包文件夹 $PACK_FOLDER 不存在！"
    exit 1
fi

# 显示解包文件夹中的文件
echo "以下是解包后的文件："
files=($(ls "$UNPACKED_FOLDER"))
for i in "${!files[@]}"; do
    echo "$i: ${files[$i]}"
done

# 让用户选择要打包的文件
echo "请选择要打包的文件编号："
read file_num
FILE_TO_PACK="${UNPACKED_FOLDER}/${files[$file_num]}"

if [ ! -f "$FILE_TO_PACK" ]; then
    echo "选中的文件不存在！"
    exit 1
fi

# 打包操作
echo "开始打包：$FILE_TO_PACK"
./quickbms/script.bms "$FILE_TO_PACK" "$PACK_FOLDER"

# 打包完成提示
echo "打包完成！打包后的文件已保存到：$PACK_FOLDER"
