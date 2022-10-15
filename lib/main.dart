import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tag File Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: Column(
//column properities:
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //column children:
                    children: [
                      //first column
                      Expanded(
                        child: Container(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                        child: Text('TAGS',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 249, 249, 249),
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold)))),
                                Expanded(
                                    child: Container(
                                        child: Icon(Icons.add, size: 50.0)))
                              ]),
                        ),
                      ),

//2nd Column:
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10.0),
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Row(children: [
                                  Text(
                                    "Books",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 42, 20, 33),
                                        fontSize: 40,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Icon(Icons.remove, size: 40),
                                  Icon(Icons.edit, size: 40)
                                ])),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Music',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 42, 20, 33),
                                      fontSize: 40,
                                      fontStyle: FontStyle.italic),
                                )),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Games',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 42, 20, 33),
                                      fontSize: 40,
                                      fontStyle: FontStyle.italic),
                                )),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Movies',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 42, 20, 33),
                                      fontSize: 40,
                                      fontStyle: FontStyle.italic),
                                )),
                          ],
                        ),
                      )
                    ]),
                padding: EdgeInsets.all(30),
                height: 1000,
                width: 400,
                color: Color.fromARGB(255, 88, 95, 100),
              )),
              Expanded(
                  child: Container(
                child: Text('FOLDERS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                padding: EdgeInsets.all(30),
                height: 1000,
                width: 800,
                color: Color.fromARGB(255, 167, 176, 183),
              ))
            ],
          ),
          // margin: const EdgeInsets.all(10),
          // padding: const EdgeInsets.all(10),
          // color: Color.fromARGB(255, 144, 178, 205),
          // height: 1000,
          // width: 700,
        ));
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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
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
