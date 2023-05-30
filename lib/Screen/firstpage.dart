import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerlearning/Screen/secondpage.dart';

import '../provider/numberprovider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersProvider>(
      builder: (context, provider, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            provider.add();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("Adding"),
        ),
        body: Container(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: [
              Text(
                provider.numbers.last.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(
                      provider.numbers[index].toString(),
                      style: const TextStyle(fontSize: 20),
                    );
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen()));
                  },
                  child: const Text("Second"))
            ],
          ),
        ),
      ),
    );
  }
}
