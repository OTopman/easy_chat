#!/usr/bin/env bash


cd ..
flutter clean
rm pubspec.lock
rm -rf build/
rm -rf .android/
rm -rf .ios/
rm -rf .idea/
find . -name '*.iml' -type f -delete
rm .flutter-plugins
rm .packages
rm -rf ~/.pub-cache/
flutter pub upgrade


