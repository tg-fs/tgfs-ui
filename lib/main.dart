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
                flex: 1,
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
                          children: <Widget>[
                            const Expanded(
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
                              child: IconButton(
                                onPressed: () {
                                  // Implement add tag
                                  print("Add button pressed");
                                },
                                icon: const Icon(Icons.add),
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
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                        onPressed: () {
                                          // Implement tag click
                                          print("tag ${tagList[i]} clicked");
                                        },
                                        child: Text(
                                          tagList.elementAt(i),
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontStyle: FontStyle.italic),
                                        )),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // TODO: Implement Remove
                                      print("remove for ${tagList[i]} clicked");
                                    },
                                    icon: const Icon(Icons.remove),
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 12),
                                  IconButton(
                                    onPressed: () {
                                      // TODO: Implement Edit
                                      print("edit for ${tagList[i]} clicked");
                                    },
                                    icon: const Icon(Icons.edit),
                                    color: Colors.white,
                                  ),
                                ],
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
                flex: 2,
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
