import 'package:flutter/material.dart';

import 'package:notes_app/widget/notewidget.dart';
import 'package:notes_app/widget/pluswidget.dart';

class noteScreen extends StatefulWidget {
  const noteScreen({super.key});
  State<noteScreen> createState() {
    return _noteScreenState();
  }
}

final textController = TextEditingController();

class _noteScreenState extends State<noteScreen> {
  void addNotes() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                content: TextField(
                  controller: textController,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        child: const Text('add'),
                        onPressed: () {
                          if (textController.text.trim().length > 0) {
                            _saveNotes(textController.text);
                            Navigator.pop(context);
                            textController.clear();
                          } else {}
                        },
                      ),
                      MaterialButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context);
                          textController.clear();
                        },
                      )
                    ],
                  )
                ]));
  }

  void _saveNotes(String text) {
    setState(() {
      listesNotes.add(text);
    });
  }

  List<String> listesNotes = ["houssaine bendhieb", "cpc isimg"];
  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.grey.shade300),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(children: [
            const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.home),
                const SizedBox(width: 15),
                TextButton(
                    child: const Text('Notes'),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.settings),
                const SizedBox(width: 15),
                TextButton(child: const Text('Settings'), onPressed: () {})
              ],
            ),
          ]),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.grey.shade300),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: Row(
                  children: [
                    Text('Notes',
                        style: TextStyle(color: Colors.black, fontSize: 50)),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: listesNotes.length,
                      itemBuilder: (item, index) {
                        return Container(
                            child: Column(
                          children: [
                            noteWidget(text: listesNotes[index]),
                            const SizedBox(height: 10),
                          ],
                        ));
                      })),
              const SizedBox(height: 100),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    plusWidget(addNotes: addNotes),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
