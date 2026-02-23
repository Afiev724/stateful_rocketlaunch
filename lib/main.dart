import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  Color getColor() {
    if (_counter == 0) return Colors.red;
    if (_counter <= 50) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rocket Launch Controller')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(20),
              child: Text(
                _counter == 100 ? 'LIFTOFF!' : '$_counter',
                style: TextStyle(fontSize: 50, color: getColor()),
              ),
            ),
            Slider(
              min: 0,
              max: 100,
              value: _counter.toDouble(),
              onChanged: (double value) {
                setState(() {
                  _counter = value.toInt();
                });
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.red,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_counter < 100) _counter++;
                });
              },
              child: const Text('Ignite'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_counter > 0) _counter--;
                });
              },
              child: const Text('Decrement'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
