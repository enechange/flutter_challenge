#!/bin/bash

# api_keysから各プラットフォーム向けのAPI読み込みフィアルを生成する
# api_keysはscripts/api_keysに置くこと
# api_keysの中身は以下のようになっている
# SERVER_API_KEY=''
# GOOGLE_MAP_API_KEY=''

GIT_ROOT=$(git rev-parse --show-toplevel)

# api_keysファイルを読み込む
source api_keys

# lib/config.dartファイルを生成する
echo "const apiKey = '${SERVER_API_KEY}';" > "$GIT_ROOT/lib/config.dart"

# ios/Runner/Config.swiftファイルを生成する
echo -e "import Foundation\n\nlet googleMapAPIKey = \"${GOOGLE_MAP_API_KEY}\"" > "$GIT_ROOT/ios/Runner/Config.swift"

# Androidのlocal.propertiesファイルを生成する
echo "" >> "$GIT_ROOT/android/local.properties"
echo "google.map.api.key=${GOOGLE_MAP_API_KEY}" >> "$GIT_ROOT/android/local.properties"