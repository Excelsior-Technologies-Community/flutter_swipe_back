import 'package:flutter/material.dart';
import 'package:flutter_swipe_back/flutter_swipe_back.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Swipe Back Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipe Back Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              SwipeBackPageRoute(
                page: const DetailsPage(),
              ),
            );
          },
          child: const Text('Open Details Page'),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SwipeBack(
      style: const SwipeBackStyle(
        swipeThreshold: 0.3,
        maxSlide: 150,
        backgroundColor: Colors.black12,
      ),
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details Page'),
        ),
        body: const Center(
          child: Text(
            'Swipe from the left edge to go back',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}