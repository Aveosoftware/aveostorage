import 'package:aveostorage/aveostorage.dart';
import 'package:aveostorageexample/app/modules/store_keys.dart';
import 'package:flutter/material.dart';

class GetPrefScreen extends StatefulWidget {
  const GetPrefScreen({Key? key}) : super(key: key);

  @override
  State<GetPrefScreen> createState() => _GetPrefScreenState();
}

class _GetPrefScreenState extends State<GetPrefScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  var getStore = GetPrefStorage(); 
  @override
  void initState() {
    super.initState();
    getStore.init(containerName: "test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Storage"),
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
                  Text(getStore.read(StoreKeys.Name)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Email:"),
                  Text(getStore.read(StoreKeys.Email)),
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
                        getStore.store(StoreKeys.Name, namecontroller.text);
                        getStore.store(StoreKeys.Email, emailcontroller.text);
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
