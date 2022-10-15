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
                padding: const EdgeInsets.all(30),
                height: 1000,
                width: 400,
                color: const Color.fromARGB(255, 88, 95, 100),
                child: Column(
//column properities:
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //column children:
                    children: [
                      //first column
                      Expanded(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const <Widget>[
                              Expanded(
                                  child: Text('TAGS',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 249, 249, 249),
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold))),
                              Expanded(child: Icon(Icons.add, size: 50.0))
                            ]),
                      ),

//2nd Column:
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10.0),
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(children: const [
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
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Music',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 42, 20, 33),
                                      fontSize: 40,
                                      fontStyle: FontStyle.italic),
                                )),
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Games',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 42, 20, 33),
                                      fontSize: 40,
                                      fontStyle: FontStyle.italic),
                                )),
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
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
              )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: 1000,
                  width: 800,
                  color: const Color.fromARGB(255, 167, 176, 183),
                  child: const Text('FOLDERS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                ),
              )
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
