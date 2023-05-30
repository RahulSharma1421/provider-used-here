import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerlearning/provider/numberprovider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    super.key,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
            ],
          ),
        ),
      ),
    );
  }
}
