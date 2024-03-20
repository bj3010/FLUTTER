import 'package:apiproject/formpage.dart';
import 'package:apiproject/method_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class displayscreen extends StatefulWidget {
  const displayscreen({super.key});

  @override
  State<displayscreen> createState() => _displayscreenState();
}

class _displayscreenState extends State<displayscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("API List"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return formpage();
                    },
                  )).then((value) {
                    if (value == true) {
                      setState(() {});
                    }
                  });
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Container(
          child: Row(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: methodfile().getuser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 20,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      snapshot.data![index]["PersonName"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () async {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return formpage(
                                                    user: snapshot.data![index],
                                                  );
                                                },
                                              ),
                                            ).then((value) {
                                              if (value == true) {
                                                setState(() {});
                                              }
                                            });
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CupertinoAlertDialog(
                                                  title: const Text('Delete'),
                                                  content: Text(
                                                      'Are you sure you want to delete this user?'),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      child: const Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                    CupertinoDialogAction(
                                                      child: const Text('Delete'),
                                                      onPressed: () async {
                                                        await methodfile()
                                                            .deleteuser(snapshot
                                                            .data![index]
                                                        ["id"]);
                                                        setState(() {});
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },),
                                      ],
                                    ),
                                  ),
                                  // Expanded(child: Container(child:),),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}