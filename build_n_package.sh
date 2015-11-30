#! /bin/bash

#临时编译目录
BUILD_HOME="/Users/calios/Desktop/xcodebuild" ##此处可以自定义

PROJECT_PATH=`pwd` # ``:將命令執行結果存入變量

#TARGET_NAME=`basename $PROJECT_PATH` # basename DIR:獲取文件名；dirname DIR:取文件路徑
TARGET_NAME="bjqcjxMLearning"
BUILD_CONFIG="Release"
CODE_SIGN="iPhone Distribution: **** LTD."
PROVISIONING_PROFILE="****"

echo "------------------------ Let's move. ---------------------------"
echo "Project path: $PROJECT_PATH"
echo "Target name: $TARGET_NAME"
echo "Build configuration: $BUILD_CONFIG"
echo "Code Sign Identity: $CODE_SIGN"
echo "Provisioning Profile: $PROVISIONING_PROFILE"

#编译文件目录
BUILD_PRODUCTS_DIR="$BUILD_HOME/$TARGET_NAME/Build"
SYMROOT="$BUILD_PRODUCTS_DIR/Products"
BUILD_DIR="$BUILD_PRODUCTS_DIR/Products"
BUILD_ROOT="$BUILD_PRODUCTS_DIR/Products"
PROJECT_TEMP_DIR="$BUILD_PRODUCTS_DIR/Intermediates"
APP_PATH="$BUILD_DIR/$BUILD_CONFIG-iphoneos/$TARGET_NAME.app"
IPA_PATH="$BUILD_DIR/$BUILD_CONFIG-iphoneos/$TARGET_NAME.ipa"

#清理工程编译文件
xcodebuild clean -configuration "$BUILD_CONFIG" BUILD_DIR="$BUILD_DIR" BUILD_ROOT="$BUILD_ROOT" PROJECT_TEMP_DIR="$PROJECT_TEMP_DIR" SYMROOT="$SYMROOT" OBJROOT="$PROJECT_TEMP_DIR" 

# clean success
#xcodebuild -workspace bjqcjxMLearning.xcworkspace -scheme bjqcjxMLearning -configuration "Release Adhoc" clean

#  simple build success
xcodebuild -workspace bjqcjxMLearning.xcworkspace -scheme bjqcjxMLearning -configuration "Release" -destination generic/platform=iOS build BUILD_DIR="$BUILD_DIR" BUILD_ROOT="$BUILD_ROOT"

# build with code signature and provisioning profile BUT failed.
#xcodebuild -target "$TARGET_NAME" CODE_SIGN_IDENTITY="$CODE_SIGN" PROVISIONING_PROFILE="$PROVISIONING_PROFILE" -configuration "$BUILD_CONFIG"  -sdk iphoneos build BUILD_DIR="$BUILD_DIR" BUILD_ROOT="$BUILD_ROOT"

#  package ipa success
xcrun -sdk iphoneos PackageApplication -v "$APP_PATH" -o "$IPA_PATH" 

# rename ipa with current date
BUILD_DATETIME="$(date +%Y%m%d%H%M%S)"
mv $IPA_PATH "$BUILD_DIR/$BUILD_CONFIG-iphoneos/$TARGET_NAME-$BUILD_DATETIME.ipa"

# open the final ipa path
open "$BUILD_DIR/$BUILD_CONFIG-iphoneos/"