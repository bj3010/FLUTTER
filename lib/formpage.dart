import 'package:apiproject/method_files.dart';
import 'package:apiproject/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class formpage extends StatefulWidget {
  const formpage({Key? key, this.user}) : super(key: key);
  final Map<String, dynamic>? user;
  @override
  State<formpage> createState() => _formpageState();


}

class _formpageState extends State<formpage> {
  var usernameController = TextEditingController();
  var passwordcontroller = TextEditingController();
  var citycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("user form "),
        ),
        body: Form(
          child: Column(
            children: [
              TextField(controller: usernameController,
                decoration: const InputDecoration(hintText: "enter PersonName"),
              ),
              TextField(controller: passwordcontroller,
                decoration: const InputDecoration(hintText: "Password"),
              ),
              TextField(
                controller: citycontroller,
                decoration: const InputDecoration(hintText: "city"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await insertRecord().then((value) {
                    Navigator.of(context).pop(true);
                  });
                },
                child: const Text("submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> insertRecord() async {
    usermodel user = usermodel();
    user.PersonName = usernameController.text;
    user.password = passwordcontroller.text;
    user.city = citycontroller.text;

    Map<String,dynamic> map = user.mapconvert();
    var res =await methodfile().insertuser(map);
  }
}
