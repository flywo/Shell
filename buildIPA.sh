#!/bin/bash

# 查看项目信息 xcodebuild -list
BASE=/Users/yuhua/Desktop/4.0/SmarterLife/
ARCHIVE_PATH=/Users/yuhua/Desktop/4.0/IPA/
PROJECT_NAME=SmarterLifeV4

cd $BASE

xcodebuild clean -workspace ${PROJECT_NAME}.xcworkspace -scheme $PROJECT_NAME -configuration release

xcodebuild archive -workspace ${PROJECT_NAME}.xcworkspace -scheme $PROJECT_NAME -configuration release -archivePath ${ARCHIVE_PATH}${PROJECT_NAME}.xcarchive &&

cd $ARCHIVE_PATH

xcodebuild -exportArchive -archivePath ${PROJECT_NAME}.xcarchive -exportPath ${PROJECT_NAME} -exportOptionsPlist ExportOptions.plist -allowProvisioningUpdates &&

rm -rf ${PROJECT_NAME}.xcarchive
