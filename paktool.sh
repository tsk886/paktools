#!/bin/bash

# 获取目标文件夹
UNPACK_FOLDER="/storage/emulated/0/Download/to_unpack"
UNPACKED_FOLDER="/storage/emulated/0/Download/unpacked"

# 检查文件夹是否存在
if [ ! -d "$UNPACK_FOLDER" ]; then
    echo "解包文件夹 $UNPACK_FOLDER 不存在！"
    exit 1
fi

if [ ! -d "$UNPACKED_FOLDER" ]; then
    echo "解包后的数据文件夹 $UNPACKED_FOLDER 不存在！"
    exit 1
fi

# 显示目标文件夹中的文件
echo "以下是解包文件夹中的文件："
files=($(ls "$UNPACK_FOLDER"))
for i in "${!files[@]}"; do
    echo "$i: ${files[$i]}"
done

# 让用户选择解包文件
echo "请选择要解包的文件编号："
read file_num
FILE_TO_UNPACK="${UNPACK_FOLDER}/${files[$file_num]}"

if [ ! -f "$FILE_TO_UNPACK" ]; then
    echo "选中的文件不存在！"
    exit 1
fi

# 解包操作
echo "开始解包：$FILE_TO_UNPACK"
./quickbms/script.bms "$FILE_TO_UNPACK" "$UNPACKED_FOLDER"

# 解包完成提示
echo "解包完成！解包后的文件已保存到：$UNPACKED_FOLDER"
