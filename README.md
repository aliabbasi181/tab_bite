<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Gives your desktop application look like macOS Apps. 
Now you can feel macOS UI in your Windows & Linux applications.

## Features

tab_bite gives a tab bar style like macOS tab bar.

## Getting started

Install this package using command line "pub dev install "

## Usage

```dart
BiteTabBar(
    posTabs: [
    BiteTab(title: "All"),
    BiteTab(title: "Online"),
    BiteTab(title: "Take away"),
    BiteTab(title: "Dine in"),
        ],
    onChanged: (value) {
        print(value);
        activeIndex = value;
        setState(() {});
    },
),
```

## Contribute to the package
https://github.com/aliabbasi181/tab_bite