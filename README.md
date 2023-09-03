# Flutter Issue - Kernel_blob.bin in Release mode

This repo contains a simple Flutter counter hello world app, and a simple iOS Xcode project in which opens the FlutterEngine.

> Issue link: [Issue 133938](https://github.com/flutter/flutter/issues/133938)

Hey all, I've been having some trouble embedding Flutter on a native iOS app. 
I've been following the [Add a Flutter screen to an iOS app documentation](https://docs.flutter.dev/add-to-app/ios/add-flutter-screen?tab=engine-swiftui-tab), and the only time that it has worked is if I follow [Option B - Embed frameworks in xcode](https://docs.flutter.dev/add-to-app/ios/project-setup#option-b---embed-frameworks-in-xcode), but specifically .xcframeworks that were generated in the *Debug* folder.

The entire error log message I get is as follows:
> 2023-09-03 10:57:39.771876-0300 HostApp[65357:3376845] Failed to find snapshot: /Users/alvarobarros/Library/Developer/CoreSimulator/Devices/CB35362B-3FC7-49E1-9A48-F4BC55ADAD67/data/Containers/Bundle/Application/95711AB2-7B50-4E48-9BBB-2FCF32034F82/HostApp.app/Frameworks/App.framework/flutter_assets/kernel_blob.bin

And I get it, the *kernel_blob.bin* file contains Dart code that is used while running on JIT or Debug.
The issue is, I get this error log even when using both .xcframework files generated on *Release* folder.

And it makes sense - Release/App.xcframework should not have a kernel_blob.bin file. But then Release/Flutter.xcframework should not be looking for it.

Below is my `flutter doctor --verbose` output:
```
[!] Flutter (Channel stable, 3.10.6, on macOS 13.0 22A8380 darwin-arm64, locale en-BR)
    • Flutter version 3.10.6 on channel stable at /Users/alvarobarros/fvm/versions/3.10.6
    ! Warning: `dart` on your path resolves to /opt/homebrew/Cellar/dart/3.0.7/libexec/bin/dart, which is not inside your current
      Flutter SDK checkout at /Users/alvarobarros/fvm/versions/3.10.6. Consider adding /Users/alvarobarros/fvm/versions/3.10.6/bin to
      the front of your path.
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision f468f3366c (8 weeks ago), 2023-07-12 15:19:05 -0700
    • Engine revision cdbeda788a
    • Dart version 3.0.6
    • DevTools version 2.23.1
    • If those were intentional, you can disregard the above warnings; however it is recommended to use "git" directly to perform
      update checks and upgrades.

[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
    • Android SDK at /Users/alvarobarros/Library/Android/sdk
    • Platform android-34, build-tools 34.0.0
    • Java binary at: /Applications/Android Studio.app/Contents/jbr/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 17.0.6+0-17.0.6b829.9-10027231)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 14.3.1)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Build 14E300c
    • CocoaPods version 1.12.1

[✗] Chrome - develop for the web (Cannot find Chrome executable at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome)
    ! Cannot find Chrome. Try setting CHROME_EXECUTABLE to a Chrome executable.

[✓] Android Studio (version 2022.3)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 17.0.6+0-17.0.6b829.9-10027231)

[✓] VS Code (version 1.81.0)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.70.0

[✓] Connected device (2 available)
    • iPhone 14 Pro (mobile) • CB35362B-3FC7-49E1-9A48-F4BC55ADAD67 • ios          • com.apple.CoreSimulator.SimRuntime.iOS-16-4
      (simulator)
    • macOS (desktop)        • macos                                • darwin-arm64 • macOS 13.0 22A8380 darwin-arm64

[✓] Network resources
    • All expected network resources are available.
```
I'm using [fvm](https://fvm.app/) to manage different Flutter versions, but I have other people on my team that got this issue without FVM.

I have created [a repo](https://github.com/AlvBarros/flutter_issue_kernel_blob) for this issue. It contains a simple Flutter counter hello world app, and a simple iOS Xcode project in which opens the FlutterEngine.

If is there any more info needed, please let me know.

Thanks in advance!