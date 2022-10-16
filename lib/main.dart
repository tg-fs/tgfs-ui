import 'dart:convert';
import 'dart:io';

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
  List<String> tagList = [];
  var fileNames = <String>[];
  var filePaths = <String>[];
  @override
  void initState() {
    fetchTags();
    fileNames = ["inferno.pdf", "japanesesong.mp3", "bottle.png"];
    filePaths = ["/home/lain", "/mnt/hd1/music", "/home/chococandy/Pictures"];

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
                            const Text(
                              'TAGS',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(child: Container()),
                            IconButton(
                              onPressed: () {
                                fetchTags();
                              },
                              icon: const Icon(Icons.refresh),
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {
                                // Implement add tag
                                print("Add button pressed");
                              },
                              icon: const Icon(Icons.add),
                              color: Colors.white,
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
                                            print(
                                                "tag ${tagList.elementAt(i)} clicked");
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
                                        print(
                                            "remove for ${tagList.elementAt(i)} clicked");
                                      },
                                      icon: const Icon(Icons.remove),
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 12),
                                    IconButton(
                                      onPressed: () {
                                        // TODO: Implement Edit
                                        print(
                                            "edit for ${tagList.elementAt(i)} clicked");
                                      },
                                      icon: const Icon(Icons.edit),
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              );
                            }),
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
                    child: Column(children: [
                      const Text('FOLDERS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      Expanded(
                        child: ListView.builder(
                          //fileNames and filePaths
                          itemCount: fileNames.length,
                          itemBuilder: (context, i) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    fileNames.elementAt(i),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 18, 15, 15),
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Text(
                                    filePaths.elementAt(i),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 18, 15, 15),
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ]),
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

  void fetchTags() async {
    ProcessResult tgfsOutput = await Process.run('zsh', ['-c', 'tgfs tags']);
    LineSplitter ls = const LineSplitter();
    List<String> tags = ls.convert(tgfsOutput.stdout);
    tags.sort();

    setState(() {
      tagList = tags;
    });
  }
}
