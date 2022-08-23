import 'package:flutter/material.dart';
class SqlExScreen extends StatefulWidget {
  const SqlExScreen({Key? key}) : super(key: key);

  @override
  State<SqlExScreen> createState() => _SqlExScreenState();
}

class _SqlExScreenState extends State<SqlExScreen> {
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
                        
                      });
                    },
                    child: const Text("Save")),
              ),
              Table(
                
              ),

            ],
          ),
        ),
      ),
    );
  }

}