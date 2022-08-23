import 'package:aveostorage/aveostorage.dart';
import 'package:aveostorageexample/app/modules/store_keys.dart';
import 'package:flutter/material.dart';

class FlutterSSScreen extends StatefulWidget {
  const FlutterSSScreen({Key? key}) : super(key: key);

  @override
  State<FlutterSSScreen> createState() => _FlutterSSScreenState();
}

class _FlutterSSScreenState extends State<FlutterSSScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  String name = "";
  String email = "";
  @override
  void initState() {
    super.initState();
  }

  syncValue() async {
    name = await SecurePref.read(StoreKeys.Name);
    email = await SecurePref.read(StoreKeys.Email);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secure Storage"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Name:"),
                  Text(name),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Email:"),
                  Text(email),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Name:"),
              TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )),
              ),
              const SizedBox(height: 10),
              const Text("Email:"),
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      await SecurePref.store(
                          StoreKeys.Name, namecontroller.text);
                      await SecurePref.store(
                          StoreKeys.Email, emailcontroller.text);
                      syncValue();
                    },
                    child: const Text("Save")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
