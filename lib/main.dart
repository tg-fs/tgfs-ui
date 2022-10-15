import 'package:flutter/material.dart';

import 'package:tgfs_ui/vars.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tagList = <String>[];
  @override
  void initState() {
    tagList = ["movies", "books", "music"];
    super.initState();
  }

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
                  color: mainColor,
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
                              child: Text(
                                'TAGS',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Icon(
                                Icons.add,
                                size: 50.0,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),

//2nd Column:
                      Expanded(
                        child: ListView.builder(
                          itemCount: tagList.length,
                          itemBuilder: (context, i) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () {
                                  print("list element ${tagList[i]} clicked");
                                  // TODO: implement the actual thing
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      tagList.elementAt(i),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    const Icon(
                                      Icons.remove,
                                      size: 32,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 12),
                                    const Icon(
                                      Icons.edit,
                                      size: 32,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: 1000,
                  width: 800,
                  color: shadeColor,
                  child: const Text('FOLDERS',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
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
