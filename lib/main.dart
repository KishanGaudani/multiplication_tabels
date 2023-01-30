import 'package:flutter/material.dart';
import 'Global.dart';
import 'first.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const Home(),
      'first': (context) => const first(),
    },
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController number1 = TextEditingController();
  String num = "";
  @override
  Widget build(BuildContext context) {
    List ind = List.generate(10, (index) => index + 1);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Multiplication Generator",
        ),
      ),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.center,
          ),
          Form(
            key: _globalKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: number1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Table Number",
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  setState(() {
                    num = value.toString();
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Table Number";
                  } else if (int.parse(value) > double.infinity) {
                    return "infinity table number";
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_globalKey.currentState!.validate()) {
            setState(() {
              _globalKey.currentState!.save();
              Global.number.add(num);
              number1.clear();
              print(Global.number);
              Navigator.of(context).pushNamed("first");
            });
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
