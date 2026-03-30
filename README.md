# ↩️ flutter_swipe_back
```
flutter_swipe_back is a smooth and customizable swipe gesture navigation library for Flutter.

It allows users to swipe from the left edge of the screen to go back, similar to native iOS page navigation.

The library provides a reusable SwipeBack widget, custom route transitions, gesture callbacks, animation control and styling options.

Developers can easily add modern swipe-back navigation behavior to Android, iOS, Web and Desktop Flutter applications using a lightweight and simple API.
```

------------------------

## 🪄 Features
```
- 👈 Swipe from left edge to go back
- 🛣 Custom SwipeBackPageRoute transition
- 🎞 Smooth slide animation support
- 🎚 Custom swipe threshold control
- 📏 Adjustable max slide distance
- 🎨 Custom background color & shadow
- ⚙️ SwipeBackController for drag tracking
- 📡 Callbacks for start, update, cancel & complete
- 🚫 Enable or disable swipe gesture anytime
- 📱 Works on Android, iOS, Web & Desktop
- 🪶 Lightweight and easy to integrate
```

--------------------------

## 📦 Installation

Add dependency in your pubspec.yaml
```
dependencies:
  flutter_swipe_back:
    path: ../flutter_swipe_back
```
Then run:
```
flutter pub get
```

----------------------------

## 🎥 Preview

https://github.com/user-attachments/assets/fc090bbf-a1b1-4e9e-ad7e-0e73484f823c

----------------------------

## 🗂 File Structure
```
flutter_swipe_back/
│
├─ lib/
│   ├─ flutter_swipe_back.dart
│   │   // Main library export file
│   │
│   ├─ main.dart
│   │   // Example demo application
│   │
│   └─ src/
│       ├─ swipe_back.dart
│       │   // Main swipe gesture widget
│       │
│       ├─ swipe_back_animation.dart
│       │   // Animation helper and slide effect logic
│       │
│       ├─ swipe_back_controller.dart
│       │   // Controller for swipe progress tracking
│       │
│       ├─ swipe_back_route.dart
│       │   // Custom page route with swipe support
│       │
│       └─ swipe_back_style.dart
│           // Style configuration for swipe behavior
│
├─ README.md
│   // Package documentation
│
├─ LICENSE
│   // Open source license file
│
└─ pubspec.yaml
    // Package configuration file
```

-----------------------------

## 🚀 How To Use

1️⃣ Import Package
```
import 'package:flutter_swipe_back/flutter_swipe_back.dart';
```
2️⃣ Push a New Page with Swipe Support
```
Navigator.push(
  context,
  SwipeBackPageRoute(
    page: const DetailsPage(),
  ),
);
```
3️⃣ Wrap Any Screen with SwipeBack
```
SwipeBack(
  child: Scaffold(
    appBar: AppBar(
      title: const Text('Details'),
    ),
    body: const Center(
      child: Text('Swipe from left edge to go back'),
    ),
  ),
)
```
4️⃣ Customize Swipe Style
```
SwipeBack(
  style: const SwipeBackStyle(
    swipeThreshold: 0.3,
    maxSlide: 150,
    backgroundColor: Colors.black12,
  ),
  child: YourPage(),
)
```
5️⃣ Listen to Swipe Events
```
SwipeBack(
  onSwipeStart: () {
    debugPrint('Swipe started');
  },
  onSwipeUpdate: () {
    debugPrint('Swiping...');
  },
  onSwipeCancel: () {
    debugPrint('Swipe cancelled');
  },
  onSwipeComplete: () {
    debugPrint('Swipe completed');
  },
  child: YourPage(),
)
```
6️⃣ Use SwipeBackController
```
final controller = SwipeBackController();

SwipeBack(
  controller: controller,
  child: YourPage(),
)
controller.addListener(() {
  print(controller.dragPercent);
});
```

---------------------------------

## 🎛 SwipeBack Properties

| Property        | Description                                     |
| --------------- | ----------------------------------------------- |
| child           | Page or widget that supports swipe back         |
| enabled         | Enable or disable swipe gesture                 |
| controller      | Observe swipe progress                          |
| style           | Customize swipe threshold, animation and colors |
| onSwipeStart    | Called when swipe begins                        |
| onSwipeUpdate   | Called while dragging                           |
| onSwipeCancel   | Called when swipe is released before threshold  |
| onSwipeComplete | Called when swipe successfully finishes         |

----------------------------------

## 🎨 SwipeBackStyle Properties

| Property          | Description                           | Default            |
| ----------------- | ------------------------------------- | ------------------ |
| swipeThreshold    | Percent needed to trigger back action | `0.25`             |
| maxSlide          | Maximum horizontal slide distance     | `120`              |
| animationDuration | Duration of slide animation           | `250ms`            |
| animationCurve    | Curve for animation                   | `Curves.easeOut`   |
| backgroundColor   | Background color behind page          | `Colors.black12`   |
| shadow            | Shadow behind dragged page            | Default box shadow |

--------------------------------

## 📄 MIT License
```
Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files to deal in the Software without restriction.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.
```







