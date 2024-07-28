import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isZoomedIn = false;
  double _width = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Controller"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 370),
                width: _isZoomedIn
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width / 3,
                curve: _isZoomedIn ? Curves.bounceOut : Curves.bounceOut,
                child: Image.asset('assets/images/image.jpg'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isZoomedIn = !_isZoomedIn;
                  });
                },
                child: Text(_isZoomedIn ? "Zoom out" : "Zoom in"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
