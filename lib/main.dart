import 'package:flutter/material.dart';
import 'package:save_money/pages/AddTransactionPage.dart';
import 'package:save_money/pages/CalendarPage.dart';
import 'package:save_money/pages/BeautyBooking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
             Expanded(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookingPage()),
                      );
                    },
                    child: const Card(
                      color: Colors.lightGreen,
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Text(
                            'Book a Service',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddTransactionPage()),
                    );
                  },
                  child: const Card(
                    color: Colors.grey,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Text(
                          'My Transaction',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                // Card(
                //   child: SizedBox(
                //     width: 200,
                //     height: 200,
                //   ),
                // ),
              ],
            ),
            const Row(
              children: [
                Card(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Card(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Center(
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarPage(),),);
                          },
                          child: const Text("Goto Money Note")
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


