#!/bin/bash

# 清空pb文件夹
rm -rf ./pb/*

# 进入proto文件夹
cd ./file

# 获得当前目录下所有符合.proto的文件
proto_files=$(find . -type f -name "*.proto")
# 遍历
for proto_file in $proto_files; do
	# 获取文件名（不含扩展名）
	filename=$(basename -- "$proto_file")
	filename_no_ext="${filename%.*}"

	# 构建输出文件名为 .pb
	output_file="${filename_no_ext}.pb"

	# 生成文件
	./protoc $filename -o ../pb/$output_file

	# 输出
	echo "Compiled $proto_file to $output_file"
done

# 生成 ClientGate.pb
# ./protoc ./ClientGate/ClientGate.proto -o ./ClientGate/ClientGate.pb