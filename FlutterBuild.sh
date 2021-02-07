#!/bin/bash

if [ $# != 1 ]
then
    echo -e "\033[33m需要Flutter项目路径\033[0m"
    exit 1
fi

export {http,https}_proxy='http://127.0.0.1:7890'
echo -e "\033[32m开启代理\033[0m"

cd $1
echo -e "\033[32m进入Flutter项目目录\033[0m"

if [ -e ./example/lib/app_router.router.dart ]
then
    rm ./example/lib/app_router.router.dart
    echo -e "\033[32m移除router文件\033[0m"
else
    echo -e "\033[31m没有router文件\033[0m"
fi

if [ -e ./example/pubspec.lock ]
then
    rm ./example/pubspec.lock
    echo -e "\033[32m移除pubspec.lock文件\033[0m"
else
    echo -e "\033[31m没有pubspec.lock文件\033[0m"
fi

if [ -e ./pubspec.lock ]
then
    rm ./pubspec.lock
    echo -e "\033[32m移除pubspec.lock文件\033[0m"
else
    echo -e "\033[31m没有pubspec.lock文件\033[0m"
fi

echo -e "\033[32m开始拉取Flutter最新资源\033[0m"
flutter pub get &&
echo -e "\033[32m拉取Flutter最新资源成功\033[0m"

echo -e "\033[32m开始清空router缓存\033[0m"
flutter packages pub run build_runner clean &&
echo -e "\033[32m清空router缓存成功\033[0m"

echo -e "\033[32m开始构建router文件\033[0m"
flutter packages pub run build_runner build
echo -e "\033[32m构建router文件成功\033[0m"
