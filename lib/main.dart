import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.code),
            const SizedBox(width: 30.0),
            const Text('Basic App Layout'),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: const Icon(Icons.home),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: const Icon(Icons.message),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('1st Tab')),
          Center(child: Text('2nd Tab')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: Container(
        height: 56.0,
        color: Colors.blue,
        child: Center(
          child: Text('Counter = $_counter', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
