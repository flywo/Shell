#!/bin/bash

export {http,https}_proxy='http://127.0.0.1:7890'
echo -e "\033[32m开启代理\033[0m"

cd /Users/yuhua/Desktop/duia/kuaijishizi
echo -e "\033[32m进入Flutter项目目录\033[0m"

if [ -e ./pubspec.lock ]
then
    rm ./pubspec.lock
    echo -e "\033[32m移除pubspec.lock文件\033[0m"
else
    echo -e "\033[31m没有pubspec.lock文件\033[0m"
fi

echo -e "\033[32m开始清空flutter本地缓存\033[0m"
flutter clean &&
echo -e "\033[32m清空flutter本地缓存成功\033[0m"

echo -e "\033[32m开始拉取Flutter最新资源\033[0m"
flutter pub get &&
echo -e "\033[32m拉取Flutter最新资源成功\033[0m"

echo -e "\033[32m开始清空build_runner缓存\033[0m"
flutter packages pub run build_runner clean &&
echo -e "\033[32m清空build_runner缓存成功\033[0m"

echo -e "\033[32m开始构建build_runner文件\033[0m"
flutter packages pub run build_runner build --delete-conflicting-outputs &&
echo -e "\033[32m构建build_runner文件成功\033[0m"

cd /Users/yuhua/Desktop/duia/newkjs
echo -e "\033[32m进入iOS项目目录\033[0m"

echo -e "\033[32m开始pod repo update\033[0m"
pod repo update &&
echo -e "\033[32mpod repo update成功\033[0m"

echo -e "\033[32m开始pod install\033[0m"
pod install &&
echo -e "\033[32mpod install成功\033[0m"

echo -e "\033[32m打开iOS项目\033[0m"
open /Users/yuhua/Desktop/duia/newkjs/kuaijishi.xcworkspace &&
echo -e "\033[32m脚本结束\033[0m"
