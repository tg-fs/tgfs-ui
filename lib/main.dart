import 'dart:convert';
import 'dart:io';

import 'package:open_url/open_url.dart';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tgfs_ui/vars.dart';

void main() {
  runApp(MaterialApp(
      title: 'Tag File Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController editTagTextController;
  late TextEditingController createTagTextController;
  List<String> tagList = [];
  var fileNames = <String>[];
  var filePaths = <String>[];
  String activeTag = "";
  @override
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor:
          MaterialStateColor.resolveWith((states) => Colors.lightBlue),
      padding: EdgeInsets.all(20));

  void initState() {
    fetchTags();

    editTagTextController = TextEditingController();
    createTagTextController = TextEditingController();
    super.initState();
  }

  void dispose() {
    editTagTextController.dispose();
    createTagTextController.dispose();

    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            //addTags(tagName);
                            print("Add button pressed");
                            addTagDialog(context);
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
                                        activeTag = tagList.elementAt(i);
                                        fetchFileList();
                                      },
                                      child: Text(
                                        tagList.elementAt(i),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontStyle: FontStyle.italic),
                                      )),
                                ),
                                IconButton(
                                  onPressed: () {
                                    deleteTag(tagList.elementAt(i));
                                  },
                                  icon: const Icon(Icons.remove),
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 12),
                                IconButton(
                                  onPressed: () {
                                    editTagDialog(
                                        context, tagList.elementAt(i));
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
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        const Text('FOLDERS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        Expanded(child: Container()),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: style,
                          onPressed: () async {
                            if (activeTag != "") {
                              FilePickerResult? result = await FilePicker
                                  .platform
                                  .pickFiles(allowMultiple: true);
                              if (result != null) {
                                List<String> files = result.paths
                                    .map((path) => path.toString())
                                    .toList();
                                files.insert(0, "add");
                                files.insert(1, activeTag);

                                await Process.run("tgfs", files);
                                fetchFileList();
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Please select a tag first')));
                            }
                          },
                          child: const Text('Add Files'),
                        ),
                      ])),
                  Text(activeTag,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: ListView.builder(
                      //fileNames and filePaths
                      itemCount: fileNames.length,
                      itemBuilder: (context, i) {
                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      fileNames.elementAt(i),
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 18, 15, 15),
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Expanded(child: Container()),
                                    IconButton(
                                      onPressed: () {
                                        //sshjh
                                        deleteFiles(filePaths.elementAt(i));
                                      },
                                      icon: const Icon(
                                          Icons.delete_forever_outlined),
                                      color: Color.fromARGB(255, 22, 21, 21),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      filePaths.elementAt(i),
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 148, 144, 144),
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Expanded(child: Container()),
                                    TextButton(
                                      child: const Text('OPEN'),
                                      onPressed: () async {
                                        await openUrl(filePaths.elementAt(i));
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
    );
  }

  void fetchTags() async {
    ProcessResult tgfsOutput = await Process.run('tgfs', ['tags']);
    LineSplitter ls = const LineSplitter();
    List<String> tags = ls.convert(tgfsOutput.stdout);
    tags.sort();

    setState(() {
      tagList = tags;
    });
  }

  Future editTagDialog(BuildContext context, String tagName) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Edit tag $tagName"),
            content: TextField(
              autofocus: true,
              controller: editTagTextController,
              decoration: const InputDecoration(hintText: 'Enter new name'),
            ),
            actions: [
              TextButton(
                child: const Text('SAVE'),
                onPressed: () async {
                  ProcessResult tgfsOutput = await Process.run(
                      'tgfs', ['edit', tagName, editTagTextController.text]);
                  fetchTags();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));

  void deleteTag(String tagName) async {
    await Process.run('tgfs', ['delete', tagName]);
    fetchTags();
  }

  Future addTagDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text("Add TAG"),
            content: TextField(
              autofocus: true,
              controller: createTagTextController,
              decoration:
                  const InputDecoration(hintText: 'Enter new tag name:'),
            ),
            actions: [
              TextButton(
                child: const Text('SAVE'),
                onPressed: () async {
                  ProcessResult tgfsOutput = await Process.run(
                      'tgfs', ['create', createTagTextController.text]);
                  fetchTags();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
  void deleteFiles(String filePath) async {
    await Process.run('tgfs', ['remove', activeTag, filePath]);
    fetchFileList();
  }

  void fetchFileList() async {
    ProcessResult tgfsOutput = await Process.run('tgfs', ["ls", activeTag]);
    LineSplitter ls = const LineSplitter();
    List<String> files = ls.convert(tgfsOutput.stdout);
    List<String> _fileNames = [];

    for (String file in files) {
      _fileNames.add(File(file).path.split(Platform.pathSeparator).last);
    }

    setState(() {
      filePaths = files;
      fileNames = _fileNames;
    });
  }
}
