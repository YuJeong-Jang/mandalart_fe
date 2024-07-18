# make_me_better_mandalart_fe

### Installation
```sh
$ flutter pub get
```
 - require after add packages to pubspec.yaml

### Local Build
```sh
$ flutter run   (default)
or
$ flutter run --debug   (debug mode)
or
$ flutter run --release     (release mode)
or
$ flutter run -d chrome     (build web)
```
### error 
 - depends on error, but you can try
```sh
$ flutter clean
or
$ flutter pub cache clean (when cache error appear)
```
```sh
$ flutter upgrade --force
```

### Deploy
- AOS
    -apk
```sh
$ flutter build apk --release --target-platform=android-arm64 --no-tree-shake-icons
```
    - abb
```sh
$ flutter build appbundle --target-platform android-arm,android-arm64 --no-tree-shake-icons
```

 - IOS
 ```sh
 $ cd ios
 $ pod install
 ```
    - open xcode
    - select Any iOS Device (arm64)
    - Product > Archive
