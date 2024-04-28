#!/bin/bash

# 定义源目录和目标目录
source_dir="./api"
target_dir="./dist2/api"
extensions=(".yaml" ".svg" ".txt" ".__builtin__" ".json" ".md" ".png" ".sh" ".ini" ".mako" ".html" ".gitignore" ".dockerignore" ".toml" "env")  # 定义一个数组，包含所有想要复制的文件扩展名

# 循环每个扩展名
for extension in "${extensions[@]}"; do
  # 使用find命令查找所有符合当前扩展名的文件
  find "$source_dir" -type f -name "*$extension" | while read filepath; do
    # 计算文件在源目录中的相对路径
    relative_path="${filepath#$source_dir/}"

    # 创建目标目录中的相同目录结构
    mkdir -p "$target_dir/$(dirname "$relative_path")"

    # 将文件复制到目标目录
    cp "$filepath" "$target_dir/$relative_path"
    echo "Copied: $filepath to $target_dir/$relative_path"
  done
done

echo "All specified files have been copied from $source_dir to $target_dir."

