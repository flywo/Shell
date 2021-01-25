#!/bin/zsh

BASE=/Users/mac/Desktop/DGG/CPSMerchant

export {http,https}_proxy='http://127.0.0.1:7890'
echo -e "\e[32m开启代理\e[0m"

cd ${BASE}/Modules/flutter_module
echo -e "\e[32m进入Flutter项目目录\e[0m"

if [ -e ./lib/router/app_router.router.dart ]
then
    rm ./lib/router/app_router.router.dart
    echo -e "\e[32m移除router文件\e[0m"
else
    echo -e "\e[31m没有router文件\e[0m"
fi

if [ -e ./pubspec.lock ]
then
    rm ./pubspec.lock
    echo -e "\e[32m移除pubspec.lock文件\e[0m"
else
    echo -e "\e[31m没有pubspec.lock文件\e[0m"
fi

echo -e "\e[32m开始拉取Flutter最新资源\e[0m"
flutter pub get &&
echo -e "\e[32m拉取Flutter最新资源成功\e[0m"

echo -e "\e[32m开始清空router缓存\e[0m"
flutter packages pub run build_runner clean &&
echo -e "\e[32m清空router缓存成功\e[0m"

echo -e "\e[32m开始构建router文件\e[0m"
flutter packages pub run build_runner build &&
echo -e "\e[32m构建router文件成功\e[0m"

cd ${BASE}
echo -e "\e[32m进入iOS项目目录\e[0m"

if [ -d ./Pods ]
then
    rm -rf ./Pods
    echo -e "\e[32m移除Pods文件夹\e[0m"
else
    echo -e "\e[31m没有Pods文件夹\e[0m"
fi

if [ -e ./Podfile.lock ]
then
    rm ./Podfile.lock
    echo -e "\e[32m移除Podfile.lock文件\e[0m"
else
    echo -e "\e[31m没有Podfile.lock文件\e[0m"
fi

echo -e "\e[32m开始pod repo update\e[0m"
pod repo update &&
echo -e "\e[32mpod repo update成功\e[0m"

echo -e "\e[32m开始pod install\e[0m"
pod install &&
echo -e "\e[32mpod install成功\e[0m"
