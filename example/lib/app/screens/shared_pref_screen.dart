import 'package:aveostorage/aveostorage.dart';
import 'package:aveostorageexample/app/modules/store_keys.dart';
import 'package:flutter/material.dart';

class SharedPrefScreen extends StatefulWidget {
  const SharedPrefScreen({Key? key}) : super(key: key);

  @override
  State<SharedPrefScreen> createState() => _SharedPrefScreenState();
}

class _SharedPrefScreenState extends State<SharedPrefScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Prefrences"),
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
                  Text(SharedPref.getString(StoreKeys.Name)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Email:"),
                  Text(SharedPref.getString(StoreKeys.Email)),
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
                    onPressed: () {
                      setState(() {
                        SharedPref.setString(
                            StoreKeys.Name, namecontroller.text);
                        SharedPref.setString(
                            StoreKeys.Email, emailcontroller.text);
                      });
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
